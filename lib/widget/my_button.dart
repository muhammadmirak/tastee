import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function whenpress;
  String text;
  var color;
  var color1;
  MyButton({this.whenpress, this.text, this.color, this.color1});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 400,
      child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          color: color,
          child: Text(
            text,
            style: TextStyle(fontSize: 30, color: color1),
          ),
          onPressed: whenpress),
    );
  }
}
