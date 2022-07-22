import 'package:api/models/episode.dart';

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

  factory DetailedCharacters.fromJson(Map<String, dynamic> map) {
    return DetailedCharacters(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      species: map['species'] as String,
      gender: map['gender'] as String,
      status: map['status'] as String,
      location: map['location'] as String,
      origin: map['origin'] as String,
      episode: List<Episode>.from(
        (map['episode'] as List<int>).map<Episode>(
          (x) => Episode.fromJson(x as Map<String, dynamic>),
        ),
      ), 
      firstSeen: '',
    );
  }
}
