import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_100_day/router/route_handlers.dart';

import '../pages/not_found.dart';

class Routes {
  static String setting = '/setting'; // 定义路由

  static void configureRoutes(FluroRouter router) {
    // TODO: 处理未匹配到的路由时展示的页面
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const NotFoundPage();
    });

    router.define(setting, handler: settingHandler);
  }
}
