class Episode {
  final int id;
  final String name;

  Episode({
    required this.id,
    required this.name,
  });

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      id: json['id']?.toInt() ?? 0,
      name: json['name'] ?? '',
    );
  }
}