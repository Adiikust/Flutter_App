import 'package:flutter/material.dart';
import 'package:flutter_app/Widget/network_controller.dart';
import 'package:provider/provider.dart';

class NetworkConnectivityScreen extends StatelessWidget {
  const NetworkConnectivityScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final networkController = context.watch<NetworkController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Network Connectivity"),
      ),
      body: networkController.isOnline
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: const Image(
                      image: AssetImage("assets/images/shirt.jpg"),
                      height: 350,
                    ),
                  ),
                  const Text(
                    'Amanda\'s Polo Shirt',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff333333),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    '\$50.20',
                    style: TextStyle(
                      color: Color(0xff777777),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff333333),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'A versatile full-zip that you can wear all day long and even...',
                    style: TextStyle(
                      color: Color(0xff777777),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.wifi_off,
                    size: 80,
                    color: Colors.red,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'No internet connection',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
