import 'package:flutter/material.dart';
import 'package:flutter_fitness/pages/home_page.dart';
import 'package:line_icons/line_icons.dart';

import '../theme/colors.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        HomePage(),
        Center(child: Text("chart")),
        Center(child: Text('Camera')),
        Center(
          child: Text('Profile'),
        ),
      ],
    );
  }

  getFooter() {
    List items = [
      LineIcons.home,
      LineIcons.pieChart,
      LineIcons.camera,
      LineIcons.user
    ];
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        color: white,
        border: Border(
          top: BorderSide(
            width: 1,
            color: black.withOpacity(0.1),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
          top: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            return InkWell(
              onTap: () {
                setState(() {
                  pageIndex = index;
                });
              },
              child: Column(
                children: [
                  Icon(
                    items[index],
                    size: 28,
                    color: pageIndex == index ? thirdColor : black,
                  ),
                  const SizedBox(height: 5),
                  pageIndex == index
                      ? Container(
                          height: 6,
                          width: 6,
                          decoration: const BoxDecoration(
                            color: thirdColor,
                            shape: BoxShape.circle,
                          ),
                        )
                      : Container()
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
