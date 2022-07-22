import 'package:api/models/character.dart';

class PaginatedCharacters {
  final int page;
  final List<Character> results;
  final int totalPages;
  final int totalResults;

  PaginatedCharacters({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PaginatedCharacters.fromJson(Map<String, dynamic> map) {
    return PaginatedCharacters(
      page: map['page'] as int,
      results: List<Character>.from((map['results'] as List<int>).map<Character>((x) => Character.fromJson(x as Map<String,dynamic>),),),
      totalPages: map['totalPages'] as int,
      totalResults: map['totalResults'] as int,
    );
  }

}
