import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:team_chat/global/environments.dart';

import 'auth_service.dart';

enum ServerStatus { Online, Offline, Connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  late IO.Socket socket;

  ServerStatus get serverStatus => this._serverStatus;
  void setServerStatus(ServerStatus status) {
    this._serverStatus = status;
    notifyListeners();
  }

  void connect() async {
    final token = await AuthService.getToken();
    // Dart client
    socket = IO.io(Environments.socketUrl, {
      'transports': ['websocket'],
      'autoConnect': true,
      'forceNew': true, // Force to create a new socket
      'extraHeaders': {
        'x-token': token,
      }
    });

    socket.on('connection', (_) {
      print('Conectado al socket');
      setServerStatus(ServerStatus.Online);
      notifyListeners();
    });

    socket.on('disconnect', (_) {
      setServerStatus(ServerStatus.Offline);
      notifyListeners();
    });

    setServerStatus(ServerStatus.Online);
    notifyListeners();
  }

  void disconnect() {
    socket.disconnect();
  }
}
