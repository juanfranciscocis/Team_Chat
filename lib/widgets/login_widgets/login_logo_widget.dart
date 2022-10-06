
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {

  final String title;

  const Logo({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 120),
        child: Container(
          child: Column(
            children: [
              Image(image: AssetImage('assets/tag-logo.png'),width: 200,),
              SizedBox(height: 20),
              Text(this.title, style: TextStyle(fontSize: 25)),
            ],
          ),

        ),
      ),
    );
  }
}