import 'package:wallbay/model/wallpaper.dart';

abstract class WallpaperState {}

class InitState extends WallpaperState {}

class WallpaperIsLoading extends WallpaperState {}

class WallpaperIsLoaded extends WallpaperState {
  final List<Wallpaper> _wallpaper;
  WallpaperIsLoaded(this._wallpaper);
  List<Wallpaper> get getWallpaper => _wallpaper;
}

class WallpaperIsNotLoaded extends WallpaperState {}
