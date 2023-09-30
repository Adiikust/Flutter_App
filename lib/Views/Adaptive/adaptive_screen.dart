import 'package:flutter/material.dart';

class AdaptiveScreen extends StatelessWidget {
  const AdaptiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adaptive Widget"),
      ),
      body: Column(
        children: [
          const Text("CircularProgressIndicator add Adaptive"),
          const SizedBox(height: 12),
          const CircularProgressIndicator.adaptive(),
          const Divider(color: Colors.red, thickness: 3),
          const Text("Share Icon"),
          const SizedBox(height: 12),
          Icon(Icons.adaptive.share),
          const Divider(color: Colors.red, thickness: 3),
        ],
      ),
    );
  }
}
