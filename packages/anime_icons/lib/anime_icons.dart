library anime_icons;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'icons.dart';

export 'icons.dart';

class AnimeIcon extends StatelessWidget {
  const AnimeIcon(
    this.icon, {
    Key? key,
    this.color,
    this.size,
    this.solid = false,
  }) : super(key: key);

  final AnimeIcons icon;
  final Color? color;
  final double? size;
  final bool solid;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/${icon.name}.svg',
      color: color ?? IconTheme.of(context).color,
      width: size ?? IconTheme.of(context).size,
      height: size ?? IconTheme.of(context).size,
      alignment: Alignment.center,
      package: 'anime_icons',
    );
  }
  //
}
