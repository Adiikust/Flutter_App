import 'package:flutter/material.dart';
import 'package:flutter_app/Widget/custome_extension.dart';

class ExtensionScreen extends StatelessWidget {
  const ExtensionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int number = 100000000;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Extension screen"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const Text(
                "Date: dd/mm/yyyy",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 12),
              Text(
                DateTime.now().toCustomDate(),
                style: const TextStyle(fontSize: 20),
              ),
              const Divider(color: Colors.red, thickness: 3),
              const Text(
                "adnan: Adnan",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 12),
              Text(
                "adnan".toCustomFirstWordCapital(),
                style: const TextStyle(fontSize: 20),
              ),
              const Divider(color: Colors.red, thickness: 3),
              const Text(
                "Integer to String : 1 to One",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 12),
              Text(
                number.toWords(),
                style: const TextStyle(fontSize: 20),
              ),
              const Divider(color: Colors.red, thickness: 3),
            ],
          ),
        ));
  }
}
