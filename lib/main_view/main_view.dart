import 'package:dominator_app/widgets/avatar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class UserMenuButton extends StatefulWidget {
  const UserMenuButton({super.key});
  @override
  State<UserMenuButton> createState() => _UserMenuButton();
}

class _UserMenuButton extends State<UserMenuButton> {
  bool showSidebar = false;

  @override
  void initState() {
    super.initState();
  }

  void _showSidebar() {
    setState(() {
      showSidebar = !showSidebar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _showSidebar,
      child: const Icon(Icons.menu),
    );
  }
}

class UserMenuSideBar extends StatelessWidget {
  const UserMenuSideBar({super.key});

  Widget sideBarListElement(
      {required String text,
      double fontSize = 20,
      Widget? leadingElement,
      void callbackFunction}) {
    return ListTile(
      leading: leadingElement,
      titleTextStyle: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      title: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height,
        color: const Color.fromARGB(31, 64, 163, 216),
        child: Column(
          children: [
            sideBarListElement(
                text: "Nombre de usuario",
                fontSize: 25,
                leadingElement: const AvatarIcon(circleRadius: 20)),
            sideBarListElement(text: "Mis rutas"),
            sideBarListElement(text: "Configuración"),
            sideBarListElement(text: "Ayuda"),
          ],
        ),
      ),
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        drawerDragStartBehavior: DragStartBehavior.start,
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(top: 16, left: 13, child: UserMenuButton()),
              UserMenuSideBar()
            ],
          ),
        ));
  }
}
