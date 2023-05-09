import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AnimeCard extends StatelessWidget {
  const AnimeCard({
    Key? key,
    this.score = 9.0,
    this.height = 200,
    this.width = 150,
    required this.image,
  }) : super(key: key);

  final String image;
  final double? score;
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
          image: renderImage(image),
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
              child: Text(
                score.toString(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }

  ImageProvider<Object> renderImage(String url) {
    final result = url.contains('http')
        ? CachedNetworkImageProvider(url)
        : AssetImage(url);
    return result as ImageProvider<Object>;
  }
}
