import 'package:flutter/material.dart';
import 'package:chat_app/screens/chat_detail_page.dart'; 

class ConversationList extends StatelessWidget {
  final String name;
  final String messageText;
  final String time;
  final bool isMessageRead;
  final VoidCallback onTap; 

  const ConversationList({
    Key? key,
    required this.name,
    required this.messageText,
    required this.time,
    required this.isMessageRead,
    required this.onTap, // Add onTap callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Use onTap callback
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 30,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    messageText,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Spacer(),
            Text(
              time,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(width: 10),
            if (!isMessageRead)
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
