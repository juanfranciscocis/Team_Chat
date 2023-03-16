import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:team_chat/services/auth_service.dart';
import 'package:team_chat/services/socket_service.dart';
import 'package:team_chat/services/usuarios_service.dart';

import '../models/usuario.dart';

class UsuariosPage extends StatefulWidget {
  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final usuariosService = UsuariosService();
  List<UsuarioDb> usuarios = [];

  //final usuarios = [
  //UsuarioDb(uid: '1', nombre: 'María', email: 'test1@test.com', online: true),
  //UsuarioDb(
  //uid: '2', nombre: 'Melissa', email: 'test2@test.com', online: false),
  //UsuarioDb(
  //  uid: '3', nombre: 'Fernando', email: 'test3@test.com', online: true),
  //];

  @override
  void initState() {
    this._cargarUsuarios();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: true);
    final socketService = Provider.of<SocketService>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(authService.usuario.nombre,
              style: TextStyle(color: Color.fromARGB(221, 255, 255, 255))),
          elevation: 1,
          backgroundColor: Color.fromARGB(255, 80, 128, 222),
          leading: IconButton(
            icon: Icon(Icons.exit_to_app, color: Colors.black87),
            onPressed: () {
              socketService.disconnect();
              AuthService.deleteToken();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(Icons.check_circle,
                  color: authService.usuario.online
                      ? Color.fromARGB(255, 77, 204, 185)
                      : Colors.red),
              // child: Icon( Icons.offline_bolt, color: Colors.red ),
            )
          ],
        ),
        body: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          onRefresh: _cargarUsuarios,
          header: WaterDropHeader(
            complete: Icon(Icons.check, color: Colors.blue[400]),
            waterDropColor: Colors.blue[400]!,
          ),
          child: _listViewUsuarios(),
        ));
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, i) => _usuarioListTile(usuarios[i]),
        separatorBuilder: (_, i) => Divider(),
        itemCount: usuarios.length);
  }

  ListTile _usuarioListTile(UsuarioDb usuario) {
    return ListTile(
      title: Text(usuario.nombre),
      subtitle: Text(usuario.email),
      leading: CircleAvatar(
        child: Text(usuario.nombre.substring(0, 2)),
        backgroundColor: Colors.blue[100],
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: usuario.online ? Colors.green[300] : Colors.red,
            borderRadius: BorderRadius.circular(100)),
      ),
    );
  }

  _cargarUsuarios() async {
    this.usuarios = await usuariosService.getUsuarios();
    print(usuarios);
    setState(() {});
    //await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}
