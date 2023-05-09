import 'package:animax/screens/detail.dart';
import 'package:animax/widgets/anime_card.dart';
import 'package:anime_api/model/anime.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AnimeCardList extends StatelessWidget {
  const AnimeCardList(
      {Key? key,
      required this.title,
      required this.list,
      required this.goSeeAll})
      : super(key: key);

  final String title;
  final List<AnimeWithEpisode> list;
  final void Function() goSeeAll;

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
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
              onPressed: goSeeAll,
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
          itemCount: list.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return Row(
              children: [
                GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(
                          '${AnimeDetail.routePath}?animeId=${list[index].id}');
                    },
                    child: AnimeCard(
                      image: list[index].cover,
                      score: list[index].score,
                    )),
                const SizedBox(
                  width: 12,
                )
              ],
            );
          }),
        ),
      ),
    ]);
  }
}
