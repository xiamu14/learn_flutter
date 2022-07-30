import 'package:flutter/material.dart';

class Family {
  static String ubuntu = 'ubuntu';
}

class H1 extends StatelessWidget {
  const H1(
    this.text, {
    Key? key,
    this.color = Colors.black54,
    this.size = 40,
    this.weight = FontWeight.w800,
    this.family = '',
  }) : super(key: key);

  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
  final String family;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
        fontFamily: family == '' ? Family.ubuntu : family,
      ),
    );
  }
}

class H2 extends Text {
  H2(
    String text,
    Key? key, {
    color = Colors.black54,
    size = 40,
    weight = FontWeight.w800,
    family = '',
  }) : super(
          text,
          key: key,
          style: TextStyle(
            fontSize: size,
            color: color,
            fontWeight: weight,
            fontFamily: family == '' ? Family.ubuntu : family,
          ),
        );
}
