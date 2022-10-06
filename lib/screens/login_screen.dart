import 'package:flutter/material.dart';

import '../widgets/widgets.dart';


class LoginScreen extends StatelessWidget{
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Logo(), // MAIN LOGO

            _Form(),

            Labels(),

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
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15, left: 80, right: 80),
                    child: Text('Login', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
                ),
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



