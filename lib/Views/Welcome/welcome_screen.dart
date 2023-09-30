import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Controller/Remote_Config/remote_confige_key.dart';
import 'package:flutter_app/Controller/Sign_With_Google/sign_with_google.dart';
import 'package:flutter_app/Helper/dialoges.dart';
import 'package:flutter_app/Utils/custom_color.dart';
import 'package:flutter_app/Widget/custome_sizebox.dart';
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
    "/homeScreen",
  ];

  List<String> routeName = [
    "Voice TO Text",
    "Network Connectivity",
    "Google and apple Pay",
    "Extension",
    "Adaptive",
    "Chat",
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool allowBack = await buildShowDialog(context);
        return allowBack;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
              firebaseRemoteConfig.getString(RemoteConfigKeys.appTitle) ??
                  "All Route"),
          actions: [
            IconButton(
                onPressed: () {
                  SignWithGoogle.signOut().then((value) {
                    context.pushReplacement('/googleSignInScreen');
                    Dialogs.showSnackbar(context, 'Successfully LogOut');
                  });
                },
                icon: const Icon(Icons.logout)),
            const CustomSizedBox(width: 10),
          ],
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
      ),
    );
  }

  Future<dynamic> buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: RemoteConfigKeys.getColorByName(
            firebaseRemoteConfig.getString(RemoteConfigKeys.primaryColor)),
        title: const Text('Confirm Exit',
            style: TextStyle(color: CustomColor.whiteColor)),
        content: const Text('Are you sure you want to exit?',
            style: TextStyle(color: CustomColor.whiteColor)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Disallow back action
            },
            child: const Text(
              'No',
              style: TextStyle(color: CustomColor.whiteColor),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true); // Allow back action
            },
            child: const Text('Yes',
                style: TextStyle(color: CustomColor.whiteColor)),
          ),
        ],
      ),
    );
  }
}
