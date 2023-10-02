import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Model/chat_user_model.dart';
import 'package:flutter_app/Services/services.dart';
import 'package:flutter_app/Views/Profile/profile_screen.dart';
import 'package:flutter_app/Widget/chat_user_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ChatUser> searchList = [];
  List<ChatUser> list = [];
  bool _isSearching = false;

  @override
  void initState() {
    ServicesApi.getSelfInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(CupertinoIcons.home),
        title: _isSearching
            ? TextField(
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: 'Name, Email, ...'),
                autofocus: true,
                style: const TextStyle(fontSize: 17, letterSpacing: 0.5),
                onChanged: (val) {
                  searchList.clear();
                  for (var i in searchList) {
                    if (i.name.toLowerCase().contains(val.toLowerCase()) ||
                        i.email.toLowerCase().contains(val.toLowerCase())) {
                      searchList.add(i);
                      setState(() {
                        searchList;
                      });
                    }
                  }
                },
              )
            : const Text('We Chat'),
        actions: [
          //search user button
          IconButton(
              onPressed: () {
                setState(() {
                  _isSearching = !_isSearching;
                });
              },
              icon: Icon(_isSearching
                  ? CupertinoIcons.clear_circled_solid
                  : Icons.search)),

          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            ProfileScreen(user: ServicesApi.mYProfile)));
              },
              icon: const Icon(Icons.more_vert))
        ],
      ),
      body: StreamBuilder(
        stream: ServicesApi.getAllUser(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.active:
            case ConnectionState.done:
              final data = snapshot.data?.docs;
              list =
                  data?.map((e) => ChatUser.fromJson(e.data())).toList() ?? [];
              if (list.isNotEmpty) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(top: 5),
                  itemCount: _isSearching ? searchList.length : list.length,
                  itemBuilder: (context, index) {
                    return ChatUserCard(
                        user: _isSearching ? searchList[index] : list[index]);
                  },
                );
              } else {
                return const Center(
                  child: Text('No Connections Found!',
                      style: TextStyle(fontSize: 20)),
                );
              }
          }
        },
      ),
    );
  }
}
