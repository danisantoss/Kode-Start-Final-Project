
import 'character.dart';
import 'info.dart';

class PaginatedCharacters {
  final List<Info> info;
  final List<Character> results;
  //final int totalPages;
  //final int totalResults;

  PaginatedCharacters({
    //required this.page,
    this.info = const [],
    this.results = const [],
    //required this.totalPages,
    //required this.totalResults,
  });

  factory PaginatedCharacters.fromJson(Map<String, dynamic> json) {
    return PaginatedCharacters(
      info: List.from(json['info']).map((e) => Info.fromJson(e)).toList(),
      results: List.from(json['results']).map((e) => Character.fromJson(e)).toList(),
      //totalPages: json['total_pages'],
      //totalResults: json['total_results'],
    );
  }

}
