import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Controller/Remote_Config/remote_confige_key.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);
  final FirebaseRemoteConfig firebaseRemoteConfig =
      FirebaseRemoteConfig.instance;
  List<String> route = [
    "/voiceTOTextScreen",
    "/networkConnectivityScreen",
    "/paySampleApp",
    "/extensionScreen",
    "/adaptiveScreen",
  ];

  List<String> routeName = [
    "Voice TO Text",
    "Network Connectivity",
    "Google and apple Pay",
    "Extension",
    "Adaptive",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(firebaseRemoteConfig.getString(RemoteConfigKeys.appTitle) ??
            "All Route"),
      ),
      body: ListView.builder(
        itemCount: routeName.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    context.go(route[index]);
                  },
                  child: Text(routeName[index])),
            ),
          );
        },
      ),
    );
  }
}
