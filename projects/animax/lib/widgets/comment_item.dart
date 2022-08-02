import 'package:anime_icons/anime_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentItem extends StatelessWidget {
  const CommentItem(
      {Key? key,
      required this.userName,
      required this.likeNum,
      required this.content})
      : super(key: key);

  final String userName;
  final int likeNum;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              // backgroundColor: Colors.blue,
              radius: 20,
              backgroundImage: AssetImage('assets/images/avatar_0.png'),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Text(
                userName,
                style: GoogleFonts.urbanist(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff212121),
                  ),
                ),
              ),
            ),
            const AnimeIcon(AnimeIcons.moreCircle),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          content,
          style: GoogleFonts.urbanist(
            textStyle: const TextStyle(
              color: Color(0xff212121),
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          children: [
            AnimeIcon(
              AnimeIcons.heartBold,
              color: Theme.of(context).primaryColor,
              size: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(likeNum.toString()),
            const SizedBox(
              width: 24,
            ),
            Text(
              '3 days ago',
              style: GoogleFonts.urbanist(
                textStyle: const TextStyle(
                  color: Color(0xff616161),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 26,
        ),
      ],
    );
  }
}
