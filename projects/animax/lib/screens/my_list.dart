import 'package:animax/widgets/custom_app_bar.dart';
import 'package:animax/widgets/empty.dart';
import 'package:anime_icons/anime_icons.dart';
import 'package:flutter/material.dart';

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  static String routePath = '/tabMyList';

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  final List<String> _data = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomAppBar(
            title: 'My List',
            iconName: AnimeIcons.moreCircle,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _data.isNotEmpty
                  ? Container()
                  : const Center(
                      child: Empty(
                        image: Image(
                          image: AssetImage('assets/images/my_list_empty.png'),
                        ),
                        title: 'Your List is Empty',
                        subTitle:
                            'It seems that you haven\'t added any anime to the list',
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
