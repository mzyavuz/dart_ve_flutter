import 'package:flutter/material.dart';

class TextFieldWithController extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String label;

  const TextFieldWithController({Key? key, required this.controller, required this.label, required this.hintText}) : super(key: key);



  @override
  State<TextFieldWithController> createState() =>
      _TextFieldWithControllerState();
}

class _TextFieldWithControllerState extends State<TextFieldWithController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20,10,20,10),
      child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.orange,
                width: 2.0,
              ),
            ),
            labelText: widget.label,
            labelStyle: const TextStyle(
              fontFamily: 'PatrickHand',
            ),
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
          )),
    );
  }
}
