import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatDetailPage extends StatefulWidget {
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  TextEditingController _messageController = TextEditingController();
  List<String> messages = [];

  static const String serverUrl = 'http://localhost:1337';
  static const String messagesEndpoint = '/api/chat-messages'; // Update endpoint if needed

  void sendMessage(String message) async {
    Map<String, dynamic> requestBody = {
      'data': {
        'message_content': message,
        'username': 'sender', // Update with actual username logic
      },
    };

    try {
      final response = await http.post(
        Uri.parse('$serverUrl$messagesEndpoint'),
        body: json.encode(requestBody),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Update UI with the new message immediately
        setState(() {
          messages.add(message);
        });
        _messageController.clear(); // Clear input field after sending
      } else {
        print('Failed to send message: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error sending message: $e');
    }
  }

  void getMessages() async {
    try {
      final response = await http.get(Uri.parse('$serverUrl$messagesEndpoint'));

      if (response.statusCode == 200) {
        List<dynamic> responseBody = json.decode(response.body);
        setState(() {
          messages = responseBody.map((msg) => msg['message_content'].toString()).toList();
        });
      } else {
        print('Failed to fetch messages: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching messages: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat Detail")),
      body: Container(
        width: double.infinity, // Set container width to full screen width
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(messages[index]));
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              color: Colors.grey[200],
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(hintText: 'Enter your message'),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      String message = _messageController.text.trim();
                      if (message.isNotEmpty) {
                        sendMessage(message);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}

