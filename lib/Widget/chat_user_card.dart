import 'package:flutter/material.dart';
import 'package:flutter_app/Model/chat_user_model.dart';
import 'package:flutter_app/Views/Chatting/chat_screen.dart';

class ChatUserCard extends StatefulWidget {
  final ChatUser user;
  const ChatUserCard({super.key, required this.user});

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ChatScreen(user: widget.user)));
          },
          child: ListTile(
            leading: InkWell(
              onTap: () {},
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.user.image),
              ),
            ),

            //user name
            title: Text(widget.user.name),

            //last message
            subtitle: Text(widget.user.about),

            //last message time
            trailing: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                  color: Colors.red.shade400,
                  borderRadius: BorderRadius.circular(10)),
            ),
            // trailing: const Text(
            //   "03.00 PM",
            //   style: TextStyle(color: Colors.black54),
            // ),
          ),
        ));
  }
}
