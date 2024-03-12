import 'package:flutter/material.dart';

class AvatarIcon extends StatefulWidget {
  const AvatarIcon({super.key});

  @override
  State<AvatarIcon> createState() => _AvatarIcon();
}

class _AvatarIcon extends State<AvatarIcon> {
  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 100,
      backgroundColor: Color.fromRGBO(64, 162, 216, 0.25),
      // backgroundImage: AssetImage("images/smart-home.png"),  //Se abre al circulo
      child: Image(
          image: AssetImage("images/smart-home.png")), //Se cierra al circulo
    );
  }
}