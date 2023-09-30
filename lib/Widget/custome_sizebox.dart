import 'package:flutter/material.dart';

class CustomSizedBox extends StatelessWidget {
  final double? width;
  final double? height;

  const CustomSizedBox({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
