import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final btnColor;
  VoidCallback onPressed;

  MyButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.btnColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        color: btnColor,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ));
  }
}
