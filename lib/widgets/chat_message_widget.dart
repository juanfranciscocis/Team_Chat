import 'package:flutter/material.dart';

class ChatMessageWidget extends StatelessWidget {

  final String text;
  final String uid;

  const ChatMessageWidget({
    Key? key,
    required this.text,
    required this.uid
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.uid == '123'? _myMessage() : _notMyMessage(),
    );
  }

  Widget _myMessage(){
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text(this.text),
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)
          ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3,
                  offset: Offset(0, 2),
                  spreadRadius: 3
              )
            ]
        ),
      ),
    );
  }

  Widget _notMyMessage(){
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text(this.text),
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)
          ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 3,
                offset: Offset(0, 2),
                spreadRadius: 3
              )
            ]
        ),
      ),
    );
  }


}