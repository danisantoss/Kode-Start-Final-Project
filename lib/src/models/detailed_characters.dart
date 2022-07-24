
import 'episode.dart';

class DetailedCharacters {
  final int id;
  final String name;
  final String image;
  final String species;
  final String gender;
  final String status;
  final String location;
  final String origin;
  final List<Episode> episode;
  final String firstSeen;

  DetailedCharacters({
    required this.id,
    required this.name,
    required this.image,
    required this.species,
    required this.gender,
    required this.status,
    required this.location,
    required this.origin,
    this.episode = const [],
    required this.firstSeen,
  });

  factory DetailedCharacters.fromJson(Map<String, dynamic> json) {
    return DetailedCharacters(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      species: json['species'],
      gender: json['gender'],
      status: json['status'],
      location: json['location'],
      origin: json['origin'],
      episode: List.from(json['episode']).map((e) => Episode.fromJson(e)).toList(),
      firstSeen: '',
    );
  }
}
