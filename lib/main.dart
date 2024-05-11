import 'package:flutter/material.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/chat_page.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/chat': (context) => ChatPage(), 
      },
    );
  }
}
