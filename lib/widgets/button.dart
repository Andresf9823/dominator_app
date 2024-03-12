import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({super.key, this.text = 'Button' ,this.onPressed});
  final VoidCallback? onPressed;
  final String text;

  @override
  State<Button> createState() => _Button();
}

class _Button extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.065,
        child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromRGBO(64, 162, 216, 0.65),
            ),
            onPressed: () {
              setState(() {});
              widget.onPressed!();
            },
            child: Text(widget.text,
                style: const TextStyle(color: Colors.white, fontSize: 20))));
  }
}