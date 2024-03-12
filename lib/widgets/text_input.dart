import 'package:dominator_app/loggin/application/email_validation.dart';
import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final String text;
  final bool emailValidationEnabled;
  final bool havePasswordBoxChecker;
  final bool hiddeValue;
  final Function(String)? onChanged;

  const TextInput(
      {super.key,
      required this.text,
      this.emailValidationEnabled = false,
      this.havePasswordBoxChecker = false,
      this.hiddeValue = false,
      required this.onChanged});

  @override
  State<TextInput> createState() => _TextInput();
}

class _TextInput extends State<TextInput> {
  bool hiddeValue = false;
  String textLabel = "";
  String textHint = "";
  final TextEditingController _controller = TextEditingController();
  Color currrentColor = const Color.fromRGBO(64, 162, 216, 0.45);
  final Color errorColor = const Color.fromARGB(113, 216, 107, 64);

  @override
  void initState() {
    textLabel = widget.text;
    hiddeValue = (widget.havePasswordBoxChecker) ? true : widget.hiddeValue;
    super.initState();  
  }

  void textFormFieldOnChange(String value) {
    if (widget.emailValidationEnabled && !emailValidation(value)) {
      currrentColor = errorColor;
      textLabel = "${widget.text} - Invalid email";
    } else {
      currrentColor = const Color.fromRGBO(64, 162, 216, 0.45);
      textLabel = widget.text;
    }

    widget.onChanged!(value);
    setState(() {});  
  }

  @override
  Widget build(BuildContext context) {
    final separation = MediaQuery.of(context).size.height * 0.05;
    return Container(
      alignment: Alignment.topCenter,
      height: MediaQuery.of(context).size.height * 0.0625,
      decoration: BoxDecoration(
          color: currrentColor,
          borderRadius: const BorderRadius.all(Radius.circular(5.0))),
      child: Padding(
        padding: EdgeInsets.only(
            bottom: separation * 0.1,
            left: separation * 0.175,
            right: separation * 0.175),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          child: TextFormField(
            cursorHeight: 22,
            obscureText: hiddeValue,
            controller: _controller,
            decoration: InputDecoration(
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
                labelStyle: const TextStyle(height: 3.75),
                labelText: textLabel,
                hintText: textHint),
            onChanged: textFormFieldOnChange,
          ),
        ),
      ),
    );
  }
}
