import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../models/models.dart';

class UsersScreen extends StatefulWidget{


  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  final users = {

    User(
      online: true,
      email: 'juanfrancistm2011@icloud.com',
      name: 'Juan Francisco',
      uid: '1'
    ),

    User(
        online: false,
        email: 'mguzmanr1973@hotmail.com',
        name: 'María Guzmán',
        uid: '2'
    ),

    User(
        online: true,
        email: 'juanfrancistm2011@gmail.com',
        name: 'Francisco Cisneros',
        uid: '3'
    )



  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TeamChat'),
        elevation: 5,
        backgroundColor: Color.fromRGBO(66, 125, 228, 1.0),
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.black54,),
            onPressed: () {
            },
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: const Icon(Icons.check_circle, color: Colors.green,),
              onPressed: () {
              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SmartRefresher(
            controller: _refreshController,
            child: listViewUsers(),
            enablePullDown: true,
            onRefresh: _loadUsers,
        ),
      )
    );
  }

  ListView listViewUsers() {
    return ListView.separated(
          itemBuilder: (context,index){
            return _userListTile(users.toList()[index]);
          },
          separatorBuilder: (context,index){
            return const Divider();
          },
          itemCount: users.length);
  }

  ListTile _userListTile(User user) {
    return ListTile(
              title: Text(user.name),
              subtitle: Text(user.email),
              leading: CircleAvatar(
                backgroundColor: Colors.blue[100],
                child: Text(user.name.substring(0,2)),
              ),
              trailing: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: user.online ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(100)
                ),
              ),
            );
  }

  _loadUsers() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

}