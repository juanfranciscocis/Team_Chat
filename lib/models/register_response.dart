// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromJson(jsonString);

import 'dart:convert';

import 'package:team_chat/models/usuario.dart';

RegisterResponse registerResponseFromJson(String str) =>
    RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) =>
    json.encode(data.toJson());

class RegisterResponse {
  RegisterResponse({
    required this.ok,
    required this.usuario,
    required this.token,
  });

  bool ok;
  UsuarioDb usuario;
  String token;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        ok: json["ok"],
        usuario: UsuarioDb.fromJson(json["usuario"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "usuario": usuario.toJson(),
        "token": token,
      };
}
