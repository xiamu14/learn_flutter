import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Tag extends StatelessWidget {
  const Tag({Key? key, required this.color, required this.text})
      : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 28,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(6.0)),
      child: Text(
        text,
        style: GoogleFonts.urbanist(
          textStyle: TextStyle(color: color),
        ),
      ),
    );
  }
}
