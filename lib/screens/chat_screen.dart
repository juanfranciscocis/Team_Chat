import 'package:flutter/material.dart';
import 'package:team_chat/widgets/widgets.dart';

class ChatScreen extends StatefulWidget{
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin{

  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  List<ChatMessageWidget> _messages = [

  ];

  bool _writting = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
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
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _messages[index],
                      );
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
                    setState(() {
                      if(text.trim().length > 0){
                        _writting = true;
                      }else{
                        _writting = false;
                      }
                    });
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
              child: IconTheme(
                data: IconThemeData(color: Colors.blue[400]),
                child: IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  icon: const Icon(Icons.send_rounded,),
                  onPressed: _writting ? () => _handleSubmitted(_textController.text.trim()) : null,
                ),
              ),
            )
          ]
        ),
      ),
    );
  }

  void _handleSubmitted(String text){
    if(text.length == 0) return;
    print(text);
    ChatMessageWidget message = ChatMessageWidget(
      text: text,
      uid: '123', animationController: AnimationController(vsync: this, duration: const Duration(milliseconds: 300)),
    );
    _messages.insert(0, message);
    message.animationController.forward();
    _focusNode.requestFocus();
    _textController.clear();
    setState(() {
      _writting = false;
    });
  }

}


