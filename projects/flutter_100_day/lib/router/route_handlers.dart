import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../pages/setting.dart';

var settingHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  final args = params['id']!.first;
  return Setting(id: args);
});
