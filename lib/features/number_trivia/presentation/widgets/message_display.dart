import 'package:flutter/material.dart';
class MessageDisplay extends StatelessWidget {
  final String message;

  MessageDisplay({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
          child: Text(message, style: TextStyle(fontSize: 30),)),);
  }
}