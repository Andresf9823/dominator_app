import 'package:dominator_app/loggin/application/sign_in.dart';
import 'package:dominator_app/loggin/domain/user.dart';
import 'package:flutter/material.dart';
import 'package:dominator_app/widgets/text_input.dart';
import 'package:dominator_app/widgets/avatar.dart';
import 'package:dominator_app/widgets/button.dart';
import 'package:dominator_app/widgets/link_message.dart';



class LogginView extends StatefulWidget {
  const LogginView({super.key});

  @override
  State<LogginView> createState() => _LogginView();
  
}

class _LogginView extends State<LogginView> {
  User user = User();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(children: <Widget>[
      Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: size.width * 0.05),
          child: const AvatarIcon(),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 10, vertical: size.width * 0.05),
          child: const Text("Log/Sign In",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500)),
        ),
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05, vertical: size.height * 0.01),
            child: TextInput(
              text: "User name",
              emailValidationEnabled: true,
              onChanged: (value) {
                user.email = value;
                setState(() {});
              },
            )),
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05, vertical: size.height * 0.01),
            child: TextInput(
              text: "Password",
              havePasswordBoxChecker: true,
              onChanged: (value) {
                user.password = value;
                setState(() {});
              },
            )),
        Padding(
          padding: EdgeInsets.symmetric(vertical: size.width * 0.05),
          child: Button( text: '  Log In  ',
            onPressed: () {
              signIn(user);
            },
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(vertical: size.width * 0.05),
            child: const LinkMessage(text: "Did you forget your password?", onPressed: null,)),
      ])
    ]));
  }
}
