import 'package:animax/widgets/custom_app_bar.dart';
import 'package:animax/widgets/top_hits_anime.dart';
import 'package:anime_icons/anime_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TopHits extends StatefulWidget {
  const TopHits({Key? key}) : super(key: key);

  static String routePath = '/topHits';

  @override
  State<TopHits> createState() => _TopHitsState();
}

class _TopHitsState extends State<TopHits> {
  final ScrollController _scrollController = ScrollController(); //listview的控制器
  int count = 4;

  @override
  initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('滑动到了最底部');
        if (count < 12) {
          count += 2;
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final sw = MediaQuery.of(context).size.width;
    // final sh = MediaQuery.of(context).size.height;
    print(count);
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const CustomAppBar(
                title: 'Top Hits Anime',
                iconName: AnimeIcons.search,
                leadingBack: true,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      print('下拉刷新');
                    },
                    child: ListView.builder(
                      controller: _scrollController,
                      itemBuilder: ((context, index) {
                        return const TopHitsAnimeItem();
                      }),
                      itemCount: count,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
