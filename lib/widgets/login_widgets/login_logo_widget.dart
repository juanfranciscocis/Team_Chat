
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
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