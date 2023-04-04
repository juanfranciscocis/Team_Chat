import 'dart:io';

class Environments {
  static String apiUrl = Platform.isAndroid
      ? 'https://flutter-team-chat-server.herokuapp.com/api'
      : 'https://flutter-team-chat-server.herokuapp.com/api';

  static String socketUrl = Platform.isAndroid
      ? 'https://flutter-team-chat-server.herokuapp.com'
      : 'https://flutter-team-chat-server.herokuapp.com';
}
