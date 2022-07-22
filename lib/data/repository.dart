import 'package:api/models/detailed_characters.dart';
import 'package:api/models/paginated_characters.dart';
import 'package:dio/dio.dart';

abstract class Repository {
  static final _dio = Dio(
    BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'),
  );

  static Future<PaginatedCharacters> getCharacters() async {
    final response = await _dio.get('/character');

    final data = PaginatedCharacters.fromJson(response.data);
    return data;
  }

  static Future<DetailedCharacters> getCharacterDetails(int characterId) async {
    final response = await _dio.get('/character/$characterId');

    final data = DetailedCharacters.fromJson(response.data);

    return data;
  }

  static Future<DetailedCharacters> getEpisodeDetails(int episodeId) async {
    final response = await _dio.get('/episode');

    final data = DetailedCharacters.fromJson(response.data);

    return data;
  }
}