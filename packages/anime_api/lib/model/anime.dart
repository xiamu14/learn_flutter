import 'package:json_annotation/json_annotation.dart';

part 'anime.g.dart';

@JsonSerializable()
class Anime {
  int id;
  String name;
  String author;
  List<String> tags;
  String release;
  double score;
  String introduction;
  String cover;
  List<String> poster;

  Anime(
    this.id,
    this.author,
    this.tags,
    this.name,
    this.cover,
    this.introduction,
    this.poster,
    this.release,
    this.score,
  );

  factory Anime.fromJson(Map<String, dynamic> srcJson) =>
      _$AnimeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AnimeToJson(this);
}

@JsonSerializable()
class Episode {
  int id;
  int animeId;
  int index;
  String cover;

  Episode(
    this.id,
    this.animeId,
    this.index,
    this.cover,
  );

  factory Episode.fromJson(Map<String, dynamic> srcJson) =>
      _$EpisodeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$EpisodeToJson(this);
}

@JsonSerializable()
class AnimeWithEpisode extends Anime {
  List<Episode> episodes;

  AnimeWithEpisode(
    this.episodes,
    int id,
    String name,
    String author,
    List<String> tags,
    String release,
    double score,
    String introduction,
    String cover,
    List<String> poster,
  ) : super(
          id,
          author,
          tags,
          name,
          cover,
          introduction,
          poster,
          release,
          score,
        );

  factory AnimeWithEpisode.fromJson(Map<String, dynamic> srcJson) =>
      _$AnimeWithEpisodeFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$AnimeWithEpisodeToJson(this);
}
