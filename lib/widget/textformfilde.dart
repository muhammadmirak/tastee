import 'package:flutter/material.dart';

class TextFormFild extends StatelessWidget {
  final String text;
  final String text1;
  final TextInputType keyboard;
  final TextEditingController controller;
  bool obscureText=false;
  TextFormFild(
      {this.text, this.text1, this.controller,this.keyboard,this.obscureText});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboard,
      initialValue: text1,
      decoration: InputDecoration(
        fillColor: Color(0xfffde6f0),
        filled: true,

        hintText: text,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
