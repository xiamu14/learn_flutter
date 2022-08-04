import 'package:animax/widgets/custom_app_bar.dart';
import 'package:animax/widgets/empty.dart';
import 'package:anime_icons/anime_icons.dart';
import 'package:flutter/material.dart';

class Download extends StatefulWidget {
  const Download({Key? key}) : super(key: key);

  static String routePath = '/tabDownload';

  @override
  State<Download> createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
  final List<String> _data = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomAppBar(
            title: 'Download',
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
                          image: AssetImage('assets/images/download_empty.png'),
                        ),
                        title: 'Your Download is Empty',
                        subTitle:
                            'Looks like you haven\'t downloaded anime at all',
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
