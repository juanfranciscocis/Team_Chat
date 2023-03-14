// To parse this JSON data, do
//
//     final renewResponse = renewResponseFromJson(jsonString);

import 'dart:convert';

import 'package:team_chat/models/usuario.dart';

RenewResponse renewResponseFromJson(String str) =>
    RenewResponse.fromJson(json.decode(str));

String renewResponseToJson(RenewResponse data) => json.encode(data.toJson());

class RenewResponse {
  RenewResponse({
    required this.ok,
    required this.usuarioDb,
    required this.token,
  });

  bool ok;
  UsuarioDb usuarioDb;
  String token;

  factory RenewResponse.fromJson(Map<String, dynamic> json) => RenewResponse(
        ok: json["ok"],
        usuarioDb: UsuarioDb.fromJson(json["usuarioDB"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "usuarioDB": usuarioDb.toJson(),
        "token": token,
      };
}
