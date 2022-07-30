import 'package:flutter/material.dart';

class P extends StatelessWidget {
  P(this.text, {Key? key}) : super(key: key);

  final String text;

  double? _size = 16;
  Color? _color = const Color.fromARGB(134, 24, 24, 24);

  fontSize(double value) {
    _size = value;
    return this;
  }

  color(Color value) {
    _color = value;
    return this;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: _size, color: _color),
    );
  }
}
