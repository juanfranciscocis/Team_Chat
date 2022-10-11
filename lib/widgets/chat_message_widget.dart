import 'package:flutter/material.dart';

class ChatMessageWidget extends StatelessWidget {

  final String text;
  final String uid;
  final AnimationController animationController;

  const ChatMessageWidget({
    Key? key,
    required this.text,
    required this.uid,
    required this.animationController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
          parent: animationController,
          curve: Curves.easeOut
        ),
        child: Container(
          child: this.uid == '123'? _myMessage() : _notMyMessage(),
        ),
      ),
    );
  }

  Widget _myMessage(){
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text(this.text),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(66, 125, 228, 1.0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)
          ),

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
        ),
      ),
    );
  }


}