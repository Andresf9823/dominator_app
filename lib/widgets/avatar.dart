import 'package:flutter/material.dart';

class AvatarIcon extends StatefulWidget {

  final double circleRadius;
  const AvatarIcon({super.key, required this.circleRadius});

  @override
  State<AvatarIcon> createState() => _AvatarIcon();
}

class _AvatarIcon extends State<AvatarIcon> {
  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      radius: widget.circleRadius,
      backgroundColor: const Color.fromRGBO(64, 162, 216, 0.25),
      // backgroundImage: AssetImage("images/smart-home.png"),  //Se abre al circulo
      child: const Image(
          image: AssetImage("images/smart-home.png")), //Se cierra al circulo
    );
  }
}