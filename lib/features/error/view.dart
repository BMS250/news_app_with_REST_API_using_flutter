import 'package:flutter/material.dart';

class ErrorHandler extends StatelessWidget {
  const ErrorHandler({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "No Available State Happened",
        style: TextStyle(
          color: Colors.red,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
