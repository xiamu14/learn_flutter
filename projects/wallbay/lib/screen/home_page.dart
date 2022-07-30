import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:wallbay/bloc/wallpaper_bloc.dart';
import 'package:wallbay/screen/category_list.dart';
import 'package:wallbay/screen/setting.dart';

import '../bloc/wallpaper_event.dart';
import 'editor_choice.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage(this.title, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WallpaperBloc _wallpaperBloc;
  List<GButton> tabs = [];
  int _selectedIndex = 0;
  PageController controller = PageController();
  @override
  void initState() {
    super.initState();

    var padding = const EdgeInsets.symmetric(horizontal: 18, vertical: 5);
    double gap = 10;

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.purple,
      iconColor: Colors.black,
      textColor: Colors.purple,
      backgroundColor: Colors.purple.withOpacity(.2),
      iconSize: 24,
      padding: padding,
      icon: Icons.verified_user,
      text: "Editor's Choice",
    ));

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.teal,
      iconColor: Colors.black,
      textColor: Colors.teal,
      backgroundColor: Colors.teal.withOpacity(.2),
      iconSize: 24,
      padding: padding,
      icon: Icons.category,
      text: 'Category',
    ));
  }

  @override
  Widget build(BuildContext context) {
    _wallpaperBloc = BlocProvider.of<WallpaperBloc>(context);
    _wallpaperBloc.add(GetAllWallpaper());
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontFamily: 'Raleway',
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => const Setting()));
            },
          ),
        ],
      ),
      body: PageView.builder(
        // onPageChanged: (pageIndex) {
        //   setState(() {
        //     _selectedIndex = pageIndex;
        //   });
        // },
        controller: controller,
        itemCount: tabs.length,
        itemBuilder: (BuildContext context, int index) {
          return getScreen(index);
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: -10,
                        blurRadius: 60,
                        color: Colors.black.withOpacity(.20),
                        offset: const Offset(0, 15))
                  ]),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                child: GNav(
                    tabs: tabs,
                    selectedIndex: _selectedIndex,
                    onTabChange: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                      controller.jumpToPage(index);
                    }),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 20, bottom: 20),
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                mini: true,
                child: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () {
                  // Navigator.push(context,
                  //     CupertinoPageRoute(builder: (context) => Search()));
                },
                elevation: 3.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  getScreen(int selectedIndex) {
    if (selectedIndex == 0) {
      return const EditorChoice();
    } else if (selectedIndex == 1) {
      return const CategoryList();
    }
  }
}
