import 'package:flutter/material.dart';

class Switcher extends StatefulWidget {
  const Switcher({Key? key}) : super(key: key);

  @override
  _SwitcherState createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Switch.adaptive(
          value: isActive,
          onChanged: (currentState) {
            isActive = currentState;
            setState(() {});
          }),
    );
  }

  changeState() {
    isActive = !isActive;
    setState(() {});
  }
}

class Page extends StatefulWidget {
  const Page({Key? key}) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  final GlobalKey<_SwitcherState> switcherKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switcher(
          key: switcherKey,
        ),
        InkWell(
          onTap: () {
            switcherKey.currentState?.changeState();
          },
        ),
      ],
    );
  }
}
