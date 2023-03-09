import 'package:flutter/cupertino.dart';

import 'chat_page.dart';
import 'loading_screen.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'users_screen.dart';

final Map<String, Widget Function(BuildContext)> screens = {
  '/users': (context) => UsuariosPage(),
  '/login': (context) => const LoginScreen(),
  '/chat': (context) => ChatPage(),
  '/loading': (context) => const LoadingScreen(),
  '/register': (context) => const RegisterScreen(),
};
