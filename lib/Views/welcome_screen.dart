import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);

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
        title: const Text("All Route"),
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
