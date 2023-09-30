import 'package:flutter/material.dart';
import 'package:flutter_app/Widget/custome_sizebox.dart';

class CustomButton extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback onPressed;

  const CustomButton(
      {super.key,
      required this.iconData,
      required this.text,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(3, 3),
            ),
          ],
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: Colors.white,
                size: 35,
              ),
              const CustomSizedBox(width: 8.0),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
