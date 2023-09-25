import 'package:flutter/material.dart';
import 'package:flutter_app/Views/network_connectivity_screen.dart';
import 'package:provider/provider.dart';

import 'Widget/network_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NetworkController>(
            lazy: true, create: (context) => NetworkController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const NetworkConnectivityScreen(),
      ),
    );
  }
}
