import 'package:flutter/material.dart';

class AyaWidget extends StatelessWidget {
  String text;
  int index;
  Color aya_text_color;
  AyaWidget(this.text, this.index, this.aya_text_color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.width * 0.02,
        horizontal: MediaQuery.of(context).size.width * 0.04,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, color: aya_text_color),
      ),
    );
  }
}
