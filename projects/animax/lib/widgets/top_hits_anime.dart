import 'package:animax/widgets/anime_card.dart';
import 'package:animax/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopHitsAnimeItem extends StatelessWidget {
  const TopHitsAnimeItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Stack(
              children: const [
                AnimeCard(image: 'assets/poster/001_1.jpeg'),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Attack on Titan Final Season Part 2',
                    style: GoogleFonts.urbanist(
                      textStyle: const TextStyle(
                        height: 1.3,
                        color: Color(0xff212121),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    '2022 | Japan',
                    style: GoogleFonts.urbanist(
                      textStyle: const TextStyle(
                        color: Color(0xff424242),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Genre: Action, Superhero, Science Fiction, Romance, Thriller',
                    maxLines: 2,
                    style: GoogleFonts.urbanist(
                      textStyle: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Color(0xff424242),
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Button(
                    width: 120,
                    height: 38,
                    text: '+ My List',
                    onTap: () {},
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
