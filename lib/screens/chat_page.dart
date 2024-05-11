import 'package:flutter/material.dart';
import 'package:chat_app/widgets/conversation_list.dart'; 
import 'package:chat_app/screens/chat_detail_page.dart'; 

// Define the ChatUsers class
class ChatUsers {
  final String name;
  final String messageText;
  final String time;

  ChatUsers({
    required this.name,
    required this.messageText,
    required this.time,
  });
}

class ChatPage extends StatelessWidget {
  final List<ChatUsers> chatUsers = [
    ChatUsers(
      name: "Md Salman",
      messageText: "Awesome Setup",
      time: "Now",
    ),
     ChatUsers(
      name: "John Doe",
      messageText: "Hello there!",
      time: "2:30 PM",
    ),
    ChatUsers(
      name: "Jane Doe",
      messageText: "Flutter is great!",
      time: "Yesterday",
    ),
    ChatUsers(
      name: "Alice Smith",
      messageText: "Good morning!",
      time: "9:45 AM",
    ),
    ChatUsers(
      name: "Bob Johnson",
      messageText: "How are you?",
      time: "Monday",
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Conversations",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 8,
                        right: 8,
                        top: 2,
                        bottom: 2,
                      ),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.add, color: Colors.pink, size: 20),
                          SizedBox(width: 2),
                          Text(
                            "Add New",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade600, size: 20),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey.shade100),
                  ),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: chatUsers.length,
              itemBuilder: (context, index) {
                return ConversationList(
                  name: chatUsers[index].name,
                  messageText: chatUsers[index].messageText,
            
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatDetailPage()),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
