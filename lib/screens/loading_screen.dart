import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';
import '../services/socket_service.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);
    Future checkLoginState(BuildContext context) async {
      final authService = Provider.of<AuthService>(context, listen: false);
      final autenticado = await authService.isLoggedIn();
      if (autenticado) {
        socketService.connect();
        print('Conectado al socket');
        print(socketService.serverStatus);
        Navigator.pushReplacementNamed(context, '/users');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    }

    return Scaffold(
      body: FutureBuilder(
          future: checkLoginState(context),
          builder: (context, snapshot) {
            return Center(
              child: Text('Cargando...'),
            );
          }),
    );
  }
}
