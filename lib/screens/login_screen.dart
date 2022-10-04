import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            _Logo(), // MAIN LOGO

            _Form(),

            _Labels(),

            SizedBox(height: 50,),
            Text('Terms and Conditions', style: TextStyle(fontWeight: FontWeight.w200),),





          ],
        ),
      ),
    );
  }
}



class _Logo extends StatelessWidget {
  const _Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 120),
        child: Container(
          width: 200,
          child: Column(
            children: [
              Image(image: AssetImage('assets/tag-logo.png')),
              SizedBox(height: 20),
              Text('Team Chat', style: TextStyle(fontSize: 30)),
            ],
          ),

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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Container(
        child: Column(
          children:[
            TextField(),
            SizedBox(height: 20),
            TextField(),
            SizedBox(height: 20),
            MaterialButton(
              child: Text('Login', style: TextStyle(color: Colors.white)),
              elevation: 0,
              color: Colors.blue,
              onPressed: (){},
            )

          ]
        ),
      ),
    );
  }
}

class _Labels extends StatelessWidget {
  const _Labels({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 20),
          Text('Create an account', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}


