import 'package:flutter/material.dart';
import 'package:nearby_text/main.dart';
import 'package:nearby_text/src/domain/models/message/message.dart';

class ChatBubble extends StatelessWidget {
  final Message message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          message.clientUID == appData.userData.uid
              ? Alignment.centerRight
              : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              message.clientUID == appData.userData.uid ? 0 : 15,
            ),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
            topRight: Radius.circular(
              message.clientUID == appData.userData.uid ? 15 : 0,
            ),
          ),
          color:
              message.clientUID == appData.userData.uid
                  ? Colors.blue
                  : Colors.yellow,
        ),
        child: Column(
          crossAxisAlignment:
              message.clientUID == appData.userData.uid
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
          children: [Text(message.name), Text(message.content!)],
        ),
      ),
    );
  }
}
