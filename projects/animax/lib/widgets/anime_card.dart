import 'package:flutter/material.dart';

class AnimeCard extends StatelessWidget {
  const AnimeCard({
    Key? key,
    this.height = 200,
    this.width = 150,
    required this.image,
  }) : super(key: key);

  final String image;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(children: [
        Positioned(
          top: 12,
          left: 12,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 34,
              height: 24,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                '9.0',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
