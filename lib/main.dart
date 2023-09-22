import 'package:flutter/material.dart';
import 'package:flutter_app/Views/google_pay_and_apple_pay_screen.dart';
import 'package:flutter_app/Views/voice_to_text_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const PaySampleApp(),
    );
  }
}
