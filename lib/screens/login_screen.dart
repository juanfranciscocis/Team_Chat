import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_chat/helpers/mostrar_alerta.dart';
import 'package:team_chat/services/auth_service.dart';

import '../services/socket_service.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Logo(
              title: "Team Chat Login",
            ), // MAIN LOGO

            _Form(),

            Labels(
              title: 'Create an account',
              screen: 'register',
            ),

            SizedBox(
              height: 50,
            ),
            Text(
              'Terms and Conditions',
              style: TextStyle(fontWeight: FontWeight.w200),
            ),
          ],
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form({
    Key? key,
  }) : super(key: key);

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final socketService = Provider.of<SocketService>(context);
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Container(
        child: Column(children: [
          CustomInputWidget(
            icon: Icons.alternate_email,
            placeholder: 'Enter your email',
            textController: emailCtrl,
            keyboardType: TextInputType.emailAddress,
            isPassword: false,
          ),

          SizedBox(
            height: 20,
          ),

          CustomInputWidget(
            icon: Icons.lock,
            placeholder: 'Enter your password',
            textController: passCtrl,
            keyboardType: TextInputType.visiblePassword,
            isPassword: true,
          ),

          SizedBox(
            height: 40,
          ),

          //TODO: CREATE BUTTON
          MaterialButton(
              child: login_button(text: 'Login'),
              onPressed: authService.autenticando
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      //print(emailCtrl.text);
                      //print(passCtrl.text);

                      final loginOk = await authService.login(
                          emailCtrl.text.trim(), passCtrl.text.trim());

                      if (loginOk) {
                        socketService.connect();
                        //Navegar a la otra pantalla, main page
                        Navigator.pushReplacementNamed(context, '/users');

                        //TODO: Conectar a socket server
                      } else {
                        //Mostrar alerta
                        mostrarAlerta(context, 'Login incorrecto',
                            "Revise sus credenciales nuevamente");
                      }
                    })
        ]),
      ),
    );
  }
}
