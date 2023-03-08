import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:team_chat/global/environments.dart';

class AuthService with ChangeNotifier {
  // Usuario usuario;

  Future login(String email, String password) async {
    final data = {'email': email, 'password': password};

    final resp = await http.post(Uri.parse('${Environments.apiUrl}/login'),
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    print(resp.body);
  }
}