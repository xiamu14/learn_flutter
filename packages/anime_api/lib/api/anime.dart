import 'package:anime_api/dio_client.dart';
import 'package:anime_api/model/anime.dart';

final dioClient = DioClient();

class AnimeApi {
  static Future<Anime> getAnimePopular() async {
    var response = await dioClient.get('/anime/popular');
    Anime result = Anime.fromJson(response.data);
    return result;
  }

  static Future<AnimeWithEpisode> getAnimeById(int id) async {
    var response =
        await dioClient.get('/anime/:id'.replaceFirst(r':id', id.toString()));
    AnimeWithEpisode result = AnimeWithEpisode.fromJson(response.data);
    return result;
  }
}
