import '../constants.dart';
//import '../enums.dart';
import '../models/character.dart';
import 'get_entities_service.dart';

class CharacterService extends GetEntitiesService {
  Future<List<Character>> getAllCharacters() async {
    List<Map<String, dynamic>> objects = await super
        .getAllEntities('${Constants.baseURL}${Constants.characterEndpoint}');

    return List<Character>.from(objects.map((x) => Character.fromJson(x)));
  }

  Future<List<Character>> getDetailedCharacter(int id) async {
    List<Map<String, dynamic>> objects = await super.getAllEntities(
        '${Constants.baseURL}${Constants.characterEndpoint}/$id');

    return List<Character>.from(objects.map((x) => Character.fromJson(x)));
  }

  /*Future<List<Character>> getFilteredCharacters(
      CharacterFilters filters) async {
    var prefs =
        '?name=${filters.name}&status=${characterStatusValues[filters.status]}&gender=${characterGenderValues[filters.gender]}&type=${filters.type}&species=${characterSpeciesValues[filters.species]}';

    List<Map<String, dynamic>> objects = await super.getAllEntities(
        '${Constants.baseURL}${Constants.characterEndpoint}$prefs');

    return List<Character>.from(objects.map((x) => Character.fromJson(x)));
  }*/
}
