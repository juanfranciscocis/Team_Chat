import 'package:flutter/cupertino.dart';

import 'chat_screen.dart';
import 'loading_screen.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'users_screen.dart';


final Map<String,Widget Function(BuildContext)> screens = {
  '/users': (context) => const UsersScreen(),
  '/login': (context) => const LoginScreen(),
  '/chat': (context) => const ChatScreen(),
  '/loading': (context) => const LoadingScreen(),
  '/register': (context) => const RegisterScreen(),

};