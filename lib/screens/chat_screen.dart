import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget{
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final _textController = TextEditingController();
  final _focusNode = FocusNode();


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
              color: Colors.black26,
              //height: 100,
              child: _inputChat(),
            )
          ]
        )
      )
    );
  }

  Widget _inputChat(){

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal:20),
        child: Row(
          children: [
            Flexible(
                child: TextField(
                  controller: _textController,
                  onSubmitted:_handleSubmitted,
                  onChanged: (String text){
                    //TODO: When the user types something
                  },
                  decoration: const InputDecoration(
                      hintText: 'Send a message',
                      border: InputBorder.none
                  ),
                  focusNode: _focusNode,
                )
            ),

            //Button to send the message
            Container(
              //margin: const EdgeInsets.only(left: 5, right: 5),
              child: IconButton(
                //highlightColor: Colors.transparent,
                //splashColor: Colors.transparent,
                icon: const Icon(Icons.send_rounded, color: Colors.blue,),
                onPressed: (){

                }
              ),
            )
          ]
        ),
      ),
    );
  }

  String _handleSubmitted(String text){
    print(text);
    _focusNode.requestFocus();
    _textController.clear();
    return text;
  }

}