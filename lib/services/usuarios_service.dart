import 'package:team_chat/models/usuario.dart';

import '../global/environments.dart';
import '../models/usuarios_response.dart';
import 'auth_service.dart';
import 'package:http/http.dart' as http;

class UsuariosService {
  Future<List<UsuarioDb>> getUsuarios() async {
    print('getUsuarios');
    try {
      final resp = await http
          .get(Uri.parse('${Environments.apiUrl}/usuarios'), headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken() as String,
      });

      print(resp.body);
      final usuariosResponse = usuariosResponseFromJson(resp.body);
      return usuariosResponse.usuarios;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
