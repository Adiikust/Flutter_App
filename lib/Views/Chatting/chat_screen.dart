import 'package:flutter/material.dart';
import 'package:flutter_app/Model/chat_user_model.dart';

class ChatScreen extends StatefulWidget {
  final ChatUser user;
  const ChatScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

final _textController = TextEditingController();

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: _appBar(),
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                    //return const SizedBox();
                    case ConnectionState.active:
                    case ConnectionState.done:
                      final _list = [];

                      if (_list.isNotEmpty) {
                        return ListView.builder(
                            reverse: true,
                            itemCount: _list.length,
                            padding: const EdgeInsets.only(top: 10),
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return const Text("data");
                            });
                      } else {
                        return const Center(
                          child: Text('Say Hii! 👋',
                              style: TextStyle(fontSize: 20)),
                        );
                      }
                  }
                },
              ),
            ),
            _chatInput(),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return InkWell(
        onTap: () {},
        child: Row(
          children: [
            //back button
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, color: Colors.black54)),

            //user profile picture
            CircleAvatar(
              backgroundImage: NetworkImage(widget.user.image),
            ),

            //for adding some space
            const SizedBox(width: 10),

            //user name & last seen time
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //user name
                Text(widget.user.name,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500)),

                //for adding some space
                const SizedBox(height: 2),

                //last seen time of user
                const Text("Last Active",
                    style: TextStyle(fontSize: 13, color: Colors.black54)),
              ],
            )
          ],
        ));
  }

  Widget _chatInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        children: [
          //input field & buttons
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  //emoji button
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.emoji_emotions,
                          color: Colors.blueAccent, size: 25)),

                  Expanded(
                      child: TextField(
                    controller: _textController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    onTap: () {},
                    decoration: const InputDecoration(
                        hintText: 'Type Something...',
                        hintStyle: TextStyle(color: Colors.blueAccent),
                        border: InputBorder.none),
                  )),

                  //pick image from gallery button
                  IconButton(
                      onPressed: () async {},
                      icon: const Icon(Icons.image,
                          color: Colors.blueAccent, size: 26)),

                  //take image from camera button
                  IconButton(
                      onPressed: () async {},
                      icon: const Icon(Icons.camera_alt_rounded,
                          color: Colors.blueAccent, size: 26)),

                  //adding some space
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),

          //send message button
          MaterialButton(
            onPressed: () {},
            minWidth: 0,
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 10),
            shape: const CircleBorder(),
            color: Colors.green,
            child: const Icon(Icons.send, color: Colors.white, size: 28),
          )
        ],
      ),
    );
  }
}
