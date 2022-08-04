import 'package:animax/widgets/custom_app_bar.dart';
import 'package:animax/widgets/empty.dart';
import 'package:anime_icons/anime_icons.dart';
import 'package:flutter/material.dart';

class ReleaseCalendar extends StatefulWidget {
  const ReleaseCalendar({Key? key}) : super(key: key);

  static String routePath = '/tabReleaseCalendar';

  @override
  State<ReleaseCalendar> createState() => _ReleaseCalendarState();
}

class _ReleaseCalendarState extends State<ReleaseCalendar> {
  final List<String> _data = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomAppBar(
            title: 'Release Calendar',
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
                          image: AssetImage(
                              'assets/images/release_calendar_empty.png'),
                        ),
                        title: 'No Release Schedule',
                        subTitle:
                            'Sorry, there is no anime release schedule on this date',
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
