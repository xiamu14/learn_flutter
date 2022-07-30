import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key, this.id = 'setting'}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text(id),
      ),
    );
  }
}
