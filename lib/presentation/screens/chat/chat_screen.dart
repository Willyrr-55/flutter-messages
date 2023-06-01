import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chats/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chats/my_message_bubble.dart';

import '../../widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://play-lh.googleusercontent.com/mRghwefxIoCam_MU3yH91IGfZG4mbPnare2QoLaNa1j375Dm5PX5Ta21nQjjrA51SPs=s256-rw'),
          ),
        ),
        title: const Text('Mi amor ❤️'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(

        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder:(context, index){
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.hers)
                  ? HerMessageBubble(message,)
                  : MyMessageBubble(message: message.text,);
                }
              )
            ),
            // Caja de Texto de mensajes
            MessageFieldBox(
              // onValue: (value) => chatProvider.sendMessage(value), 
              onValue: chatProvider.sendMessage,
            )
          ],
        ),
      ),
    );
  }
}