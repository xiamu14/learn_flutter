class Wallpaper {
  late String original;
  late String portrait;

  Wallpaper({
    required this.original,
    required this.portrait,
  });

  Wallpaper.fromMap(Map<String, dynamic> map) {
    original = map["src"]["original"];
    portrait = map["src"]["portrait"];
  }

  toJson() {
    return {
      "original": original,
      "portrait": portrait,
    };
  }
}
