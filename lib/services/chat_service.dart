import 'package:flutter/material.dart';
import 'package:team_chat/global/environments.dart';
import 'package:team_chat/models/usuario.dart';
import 'package:http/http.dart' as http;
import 'package:team_chat/services/auth_service.dart';

import '../models/mensaje.dart';
import '../models/mensajes_response.dart';

class ChatService with ChangeNotifier {
  late UsuarioDb usuarioPara; //Para quien se envia el mensaje

  Future<List<Mensaje>> getChat(String usuarioId) async {
    final resp = await http
        .get(Uri.parse('${Environments.apiUrl}/mensajes/$usuarioId'), headers: {
      'Content-Type': 'application/json',
      'x-token': await AuthService.getToken() as String,
    });

    final mensajesResponse = mensajesResponseFromJson(resp.body);

    return mensajesResponse.mensajes;
  }
}
