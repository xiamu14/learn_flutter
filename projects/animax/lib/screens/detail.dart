import 'package:animax/widgets/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimeDetail extends StatelessWidget {
  const AnimeDetail({Key? key}) : super(key: key);

  static String routePath = '/animeDetail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChewiePlayer(
          'https://v5-tt.ixigua.com/02895f0bff2491b0b7c24573e6ec98f0/62e7a6e6/video/tos/cn/tos-cn-v-6f4170/2408e935b6574daaa8345b9cc01d6077/'),
    );
  }
}
