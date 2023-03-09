import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:team_chat/global/environments.dart';
import 'package:team_chat/models/login_response.dart';

import '../models/usuario.dart';

class AuthService with ChangeNotifier {
  late UsuarioDb usuario;
  bool _autenticando = false;
  final _storage = new FlutterSecureStorage();

  //Getters and Setters
  bool get autenticando => this._autenticando;

  set autenticando(bool value) {
    this._autenticando = value;
    notifyListeners();
  }

  static Future<String?> getToken() async {
    final _storage = new FlutterSecureStorage();
    return await _storage.read(key: 'token');
  }

  static Future deleteToken() async {
    final _storage = new FlutterSecureStorage();
    return await _storage.delete(key: 'token');
  }

  //Methods

  Future<bool> login(String email, String password) async {
    this.autenticando = true;

    final data = {'email': email, 'password': password};

    final resp = await http.post(Uri.parse('${Environments.apiUrl}/login'),
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    print("${resp.statusCode}" + " RESPUESTA");
    this.autenticando = false;
    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      this.usuario = loginResponse.usuarioDb;
      print(resp.body);
      //TODO: Guardar token en lugar seguro
      await this._guardarToken(loginResponse.token);
      print("Token del Secure Storage => " + '${await getToken()}');
    } else {
      print(resp.body);

      return false;
    }

    return true;
  }

  Future _guardarToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  Future _logOut() async {
    await _storage.delete(key: 'token');
  }
}
