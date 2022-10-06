
import 'package:flutter/material.dart';
class Labels extends StatelessWidget {

  final String screen;
  final String title;


  const Labels({
    Key? key,
    required this.screen,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Register');
        Navigator.pushReplacementNamed(context, '/${this.screen}');
      },
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(this.title, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}