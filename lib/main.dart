import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_chat/services/auth_service.dart';
import 'package:team_chat/services/chat_service.dart';
import 'package:team_chat/services/socket_service.dart';

import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //CONSTRUCTOR
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(
            create: (_) =>
                SocketService()), // SINGLETON: SOLO UNA INSTANCIA DE ESTE SERVICIO EN TODO EL APLICATIVO
        ChangeNotifierProvider(create: (_) => ChatService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Team Chat',
        theme: ThemeData.dark(),
        initialRoute: '/loading',
        routes: screens,
      ),
    );
  }
}
