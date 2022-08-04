import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Empty extends StatelessWidget {
  const Empty({
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final Image image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          image,
          const SizedBox(
            height: 42,
          ),
          Text(
            title,
            style: GoogleFonts.urbanist(
              textStyle: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: 300,
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: GoogleFonts.urbanist(
                textStyle: const TextStyle(
                  color: Color(0xff424242),
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
