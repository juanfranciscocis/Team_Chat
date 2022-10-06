import 'package:flutter/material.dart';

class CustomInputWidget extends StatelessWidget {

  final IconData icon;//ICON
  final String placeholder; //HINT TEXT
  final TextEditingController textController; //GET INPUT FROM FIELD
  final TextInputType keyboardType; //KEYBOARD TYPE
  final bool isPassword; //SHOW INPUT AS PASSWORD




  const CustomInputWidget({
    Key? key,
    required this.icon,
    required this.placeholder,
    required this.textController,
    this.keyboardType = TextInputType.text,
    required this.isPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, left: 10, right:30, bottom: 5),
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        autocorrect: false,
        controller: this.textController,
        keyboardType: this.keyboardType,
        obscureText: this.isPassword,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(this.icon, color: Colors.blue[400],),
          hintText: this.placeholder,
          hintStyle: TextStyle(color: Colors.blue[100]),
        ),

      ),
    );
  }
}