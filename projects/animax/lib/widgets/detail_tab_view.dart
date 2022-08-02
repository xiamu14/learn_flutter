import 'package:animax/widgets/anime_card.dart';
import 'package:animax/widgets/comments_list.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailTabView extends StatelessWidget {
  const DetailTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ContainedTabBarView(
        tabs: [
          Text(
            'More Like This',
            style: GoogleFonts.urbanist(),
          ),
          Text(
            'Comments（29.5K）',
            style: GoogleFonts.urbanist(),
          ),
        ],
        tabBarProperties: TabBarProperties(
          background: Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 2, color: Color(0xffEEEEEE)))),
          ),
          margin: const EdgeInsets.only(bottom: 24.0),
          indicatorColor: Theme.of(context).primaryColor,
          unselectedLabelColor: const Color(0xff9E9E9E),
          labelColor: Theme.of(context).primaryColor,
          labelStyle:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        views: [
          GridView(
            padding: const EdgeInsets.all(0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 12.0,
                childAspectRatio: 150 / 200),
            children: const [
              AnimeCard(
                image: 'assets/poster/001_1.jpeg',
              ),
              AnimeCard(
                image: 'assets/poster/002_1.jpeg',
              ),
              AnimeCard(
                image: 'assets/poster/003_1.jpeg',
              ),
              AnimeCard(
                image: 'assets/poster/001_1.jpeg',
              ),
            ],
          ),
          const CommentsList(),
        ],
        // onChange: (index) => print(index),
      ),
    );
  }
}
