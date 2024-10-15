import 'package:flutter/material.dart';

class BottonScreen extends StatelessWidget {
  final String? text;
  final VoidCallback method;

  BottonScreen({super.key, this.text, required this.method});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.5,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(132, 236, 99, 8), // Button background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Rounded corners
          ),
        ),
        onPressed: method,
        child: Center(
          child: Text(
            text ?? '',
            style: const TextStyle(
              fontFamily: "cairo.ttf",
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
