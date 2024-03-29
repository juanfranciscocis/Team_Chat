import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:team_chat/global/environments.dart';

import 'auth_service.dart';

enum ServerStatus { Online, Offline, Connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  late IO.Socket _socket = IO.io(Environments.socketUrl, {
    'transports': ['websocket'],
    'autoConnect': true,
    'forceNew': true,
    //'extraHeaders': {'x-token': token}
  });

  ServerStatus get serverStatus => this._serverStatus;

  IO.Socket get socket => this._socket;
  Function get emit => this._socket.emit;

  void connect() async {
    print('Cliente conectado');
    final token = await AuthService.getToken();

    // Dart client

    this._socket = IO.io(Environments.socketUrl, {
      'transports': ['websocket'],
      'autoConnect': true,
      'forceNew': true,
      'extraHeaders': {
        'x-token': token,
      }
    });

    this._socket.on('connect', (_) {
      print('connect');
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });

    this._socket.on('disconnect', (_) {
      print('disconnect');
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });
  }

  void disconnect() {
    print('Cliente desconectado');
    this._socket.disconnect();
  }
}
