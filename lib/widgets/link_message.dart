import 'package:flutter/material.dart';

class LinkMessage extends StatefulWidget {
  final String text;
  final String? path;
  final VoidCallback? onPressed;
  const LinkMessage({super.key, required this.text, this.path, required this.onPressed});
  @override
  State<LinkMessage> createState() => _LinkMessage();
}

class _LinkMessage extends State<LinkMessage> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      child: Text(
        widget.text,
        style: const TextStyle(
            decoration: TextDecoration.underline, color: Colors.black54),
      ),
    );
  }
}
