// To parse this JSON data, do
//
//     final usuariosResponse = usuariosResponseFromJson(jsonString);

import 'dart:convert';

import 'package:team_chat/models/usuario.dart';

UsuariosResponse usuariosResponseFromJson(String str) =>
    UsuariosResponse.fromJson(json.decode(str));

String usuariosResponseToJson(UsuariosResponse data) =>
    json.encode(data.toJson());

class UsuariosResponse {
  UsuariosResponse({
    required this.ok,
    required this.usuarios,
  });

  bool ok;
  List<UsuarioDb> usuarios;

  factory UsuariosResponse.fromJson(Map<String, dynamic> json) =>
      UsuariosResponse(
        ok: json["ok"],
        usuarios: List<UsuarioDb>.from(
            json["usuarios"].map((x) => UsuarioDb.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "usuarios": List<dynamic>.from(usuarios.map((x) => x.toJson())),
      };
}
