import 'dart:developer';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Controller/Remote_Config/remote_confige_key.dart';
import 'package:flutter_app/Controller/Sign_With_Google/sign_with_google.dart';
import 'package:flutter_app/Helper/dialoges.dart';
import 'package:flutter_app/Widget/custome_button_icon_text.dart';
import 'package:flutter_app/Widget/custome_sizebox.dart';
import 'package:go_router/go_router.dart';

import '../../Services/services.dart';

class GoogleSignInScreen extends StatefulWidget {
  const GoogleSignInScreen({Key? key}) : super(key: key);

  @override
  State<GoogleSignInScreen> createState() => _GoogleSignInScreenState();
}

class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
  final FirebaseRemoteConfig firebaseRemoteConfig =
      FirebaseRemoteConfig.instance;

  _handleGoogleBtnClick() async {
    Dialogs.showProgressBar(context);
    SignWithGoogle.signInWithGoogle(context).then(
      (user) async {
        Navigator.pop(context);
        if (user != null) {
          log('\nUser: ${user.user}');
          log('\nUserAdditionalInfo: ${user.additionalUserInfo}');
          if ((await ServicesApi.userExists())) {
            context.go('/welcomeScreen');
          } else {
            await ServicesApi.createUser().then((value) {
              context.go('/welcomeScreen');
            });
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(firebaseRemoteConfig.getString(RemoteConfigKeys.appTitle) ??
            "All Route"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/shirt.jpg"),
          const CustomSizedBox(height: 30.0),
          CustomButton(
            iconData: Icons.g_translate,
            text: 'Sign In with Google',
            onPressed: () {
              _handleGoogleBtnClick();
            },
          ),
        ],
      ),
    );
  }
}
