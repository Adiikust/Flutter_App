import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_app/Services/services.dart';
import 'package:flutter_app/Utils/custom_color.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () async {
        if (ServicesApi.auth.currentUser != null) {
          log('\nUser: ${ServicesApi.auth.currentUser}');
          context.pushReplacement('/welcomeScreen');
        } else {
          context.pushReplacement('/googleSignInScreen');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(color: CustomColor.whiteColor),
        child: Center(child: Image.asset("assets/images/shirt.jpg")),
      ),
    );
  }
}
