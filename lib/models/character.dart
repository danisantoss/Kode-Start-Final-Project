class Character {
  final int id;
  final String name;
  final String image;
  final String species;
  final String gender;
  final String status;
  final String location;
  final String origin;

  Character({
    required this.id, 
    required this.name, 
    required this.image, 
    required this.species, 
    required this.gender, 
    required this.status, 
    required this.location, 
    required this.origin
  });

  factory Character.fromJson(Map<String, dynamic> map) {
    return Character(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      species: map['species'] as String,
      gender: map['gender'] as String,
      status: map['status'] as String,
      location: map['location'] as String,
      origin: map['origin'] as String,
    );
  }
}
