// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Anime _$AnimeFromJson(Map<String, dynamic> json) => Anime(
      json['id'] as int,
      json['author'] as String,
      (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      json['name'] as String,
      json['cover'] as String,
      json['introduction'] as String,
      (json['poster'] as List<dynamic>).map((e) => e as String).toList(),
      json['release'] as String,
      (json['score'] as num).toDouble(),
    );

Map<String, dynamic> _$AnimeToJson(Anime instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'author': instance.author,
      'tags': instance.tags,
      'release': instance.release,
      'score': instance.score,
      'introduction': instance.introduction,
      'cover': instance.cover,
      'poster': instance.poster,
    };

Episode _$EpisodeFromJson(Map<String, dynamic> json) => Episode(
      json['id'] as int,
      json['animeId'] as int,
      json['index'] as int,
      json['cover'] as String,
      json['videoUrl'] as String,
    );

Map<String, dynamic> _$EpisodeToJson(Episode instance) => <String, dynamic>{
      'id': instance.id,
      'animeId': instance.animeId,
      'index': instance.index,
      'cover': instance.cover,
      'videoUrl': instance.videoUrl,
    };

AnimeWithEpisode _$AnimeWithEpisodeFromJson(Map<String, dynamic> json) =>
    AnimeWithEpisode(
      (json['episodes'] as List<dynamic>)
          .map((e) => Episode.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['id'] as int,
      json['name'] as String,
      json['author'] as String,
      (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      json['release'] as String,
      (json['score'] as num).toDouble(),
      json['introduction'] as String,
      json['cover'] as String,
      (json['poster'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AnimeWithEpisodeToJson(AnimeWithEpisode instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'author': instance.author,
      'tags': instance.tags,
      'release': instance.release,
      'score': instance.score,
      'introduction': instance.introduction,
      'cover': instance.cover,
      'poster': instance.poster,
      'episodes': instance.episodes,
    };
