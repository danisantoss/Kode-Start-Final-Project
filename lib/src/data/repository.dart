import 'package:dio/dio.dart';
import '../models/detailed_characters.dart';
import '../models/paginated_characters.dart';

abstract class Repository {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://rickandmortyapi.com/api',
    ),
  );

  static Future<PaginatedCharacters> getCharacters() async {
    var response = await _dio.get('/character');

    final data = PaginatedCharacters.fromJson(response.data);
    return data;
  }

  static Future<DetailedCharacters> getCharacterDetails(int characterId) async {
    var response = await _dio.get('/character/$characterId');

    final data = DetailedCharacters.fromJson(response.data);

    return data;
  }

  static Future<DetailedCharacters> getEpisodeDetails(int episodeId) async {
    var response = await _dio.get('/episode/$episodeId');

    final data = DetailedCharacters.fromJson(response.data);

    return data;
  }
}
