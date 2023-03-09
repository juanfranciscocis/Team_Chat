import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:team_chat/global/environments.dart';
import 'package:team_chat/models/login_response.dart';

class AuthService with ChangeNotifier {
  late UsuarioDb usuario;
  bool _autenticando = false;

  bool get autenticando => this._autenticando;

  set autenticando(bool value) {
    this._autenticando = value;
    notifyListeners();
  }

  Future login(String email, String password) async {
    this.autenticando = true;

    final data = {'email': email, 'password': password};

    final resp = await http.post(Uri.parse('${Environments.apiUrl}/login'),
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    print("${resp.statusCode}" + " RESPUESTA");

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      this.usuario = loginResponse.usuarioDb;
      print(resp.body);
    } else {
      print(resp.body);
    }

    this.autenticando = false;
  }
}
