import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget{
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Color.fromRGBO(66, 125, 228, 1.0),
        title: Column(
          children:[
            CircleAvatar(
              child: Text('Te', style: TextStyle(fontSize: 10),),
              backgroundColor: Colors.blue[100],
              maxRadius: 14,
            ),
            const SizedBox(height: 5,),
            Text('Teresa', style: TextStyle(fontSize: 11),)
          ]
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    reverse: true,
                    itemBuilder: (context, index) {
                      return Text('$index');
                    }
                )
            ),

            const Divider(height: 1,),

            Container(
              color: Colors.white,
              height: 100,
            )
          ]
        )
      )
    );
  }
}