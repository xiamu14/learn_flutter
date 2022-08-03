import 'package:anime_icons/anime_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    this.solid = true,
    this.width,
    this.height = 38,
    this.icon,
    required this.color,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final void Function() onTap;
  final String text;
  final Color color;
  final AnimeIcons? icon;
  final double height;
  final double? width;
  final bool solid;

  @override
  Widget build(BuildContext context) {
    final bgColor = solid ? color : Colors.transparent;
    final contentColor = solid ? Colors.white : color;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(height / 2),
            border: Border.all(
                color: solid ? Colors.transparent : color, width: 2)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null
                  ? AnimeIcon(
                      icon!,
                      color: contentColor,
                    )
                  : Container(),
              const SizedBox(width: 6),
              Text(
                text,
                style: GoogleFonts.urbanist(
                  textStyle: TextStyle(
                      color: contentColor, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
