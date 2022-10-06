
import 'package:flutter/material.dart';

class login_button extends StatelessWidget {
  final String text;
  const login_button({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[400],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15, left: 80, right: 80),
        child: Text(this.text, style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
    );
  }
}