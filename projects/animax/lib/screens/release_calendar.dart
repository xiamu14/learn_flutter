import 'package:animax/widgets/custom_app_bar.dart';
import 'package:animax/widgets/empty.dart';
import 'package:anime_icons/anime_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_utils/date_utils.dart' as utils;

class ReleaseCalendar extends StatefulWidget {
  const ReleaseCalendar({Key? key}) : super(key: key);

  static String routePath = '/tabReleaseCalendar';

  @override
  State<ReleaseCalendar> createState() => _ReleaseCalendarState();
}

class _ReleaseCalendarState extends State<ReleaseCalendar> {
  final List<String> _data = [];
  List<DateTime> _calendar = [];
  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    final weekStartDay = utils.DateUtils.firstDayOfWeek(now);
    final List<DateTime> calendarCache = [];
    for (var i = 0; i < 7; i++) {
      final day = weekStartDay.add(Duration(days: i));
      calendarCache.add(day);
    }
    setState(() {
      _calendar = calendarCache;
      _selectedDay = now;
    });
  }

  void onSelectDay(DateTime day) {
    setState(() {
      _selectedDay = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        children: [
          const CustomAppBar(
            title: 'Release Calendar',
            iconName: AnimeIcons.moreCircle,
          ),
          SizedBox(
            width: sw,
            height: 80,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _calendar
                    .asMap()
                    .entries
                    .map(
                      (entry) => GestureDetector(
                        onTap: () {
                          onSelectDay(entry.value);
                        },
                        child: CalendarDay(
                          day: utils.DateUtils.formatDay(entry.value),
                          dayText: utils.DateUtils.weekdays[entry.key],
                          isActive: utils.DateUtils.isSameDay(
                              _selectedDay, entry.value),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
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

class CalendarDay extends StatelessWidget {
  const CalendarDay({
    Key? key,
    this.isActive = false,
    required this.day,
    required this.dayText,
  }) : super(key: key);

  final bool isActive;
  final String day;
  final String dayText;

  @override
  Widget build(BuildContext context) {
    final secondaryColor = isActive ? Colors.white : const Color(0xffbdbdbd);
    return Row(
      children: [
        Container(
          width: 50,
          height: 78,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: isActive ? Theme.of(context).primaryColor : Colors.white,
            border: isActive
                ? Border.all(color: Colors.transparent)
                : Border.all(color: secondaryColor, width: 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                dayText,
                style: GoogleFonts.urbanist(
                  textStyle: TextStyle(color: secondaryColor),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                day,
                style: GoogleFonts.urbanist(
                    textStyle: TextStyle(color: secondaryColor),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
