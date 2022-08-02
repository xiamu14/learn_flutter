import 'package:animax/widgets/anime_card.dart';
import 'package:flutter/material.dart';

class AnimeCardList extends StatelessWidget {
  const AnimeCardList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;
    return Column(children: [
      const SizedBox(
        height: 8,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0xff212121),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'See all',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      Container(
        width: sw,
        height: 200,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              return Row(
                children: [
                  AnimeCard(image: 'assets/poster/00${index + 1}_1.jpeg'),
                  const SizedBox(
                    width: 12,
                  )
                ],
              );
            })),
      ),
    ]);
  }
}
