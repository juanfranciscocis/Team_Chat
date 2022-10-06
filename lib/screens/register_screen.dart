import 'package:flutter/material.dart';

import '../widgets/widgets.dart';


class RegisterScreen extends StatelessWidget{
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Logo(title: "TeamChat Register"), // MAIN LOGO

            _Form(),

            Labels(
              title: 'Login',
              screen: 'login',),

            SizedBox(height: 50,),
            Text('Terms and Conditions', style: TextStyle(fontWeight: FontWeight.w200),),





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

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Container(
        child: Column(
            children:[

              CustomInputWidget(
                icon: Icons.person,
                placeholder: 'Enter your name',
                textController: nameCtrl,
                keyboardType: TextInputType.text,
                isPassword: false,
              ),

              SizedBox(height: 20,),

              CustomInputWidget(
                icon: Icons.alternate_email,
                placeholder: 'Enter your email',
                textController: emailCtrl,
                keyboardType: TextInputType.emailAddress,
                isPassword: false,
              ),

              SizedBox(height: 20,),

              CustomInputWidget(
                icon: Icons.lock,
                placeholder: 'Enter your password',
                textController: passCtrl,
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
              ),

              SizedBox(height: 40,),

              //TODO: CREATE BUTTON
              MaterialButton(
                  child: login_button(text: 'Register'),
                  onPressed: (){
                    print(emailCtrl.text);
                    print(passCtrl.text);
                  })
            ]
        ),
      ),
    );
  }
}





