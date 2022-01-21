class Animal {
  final String? name;
  final String? latinName;
  final String? animalType;
  final String? activeTime;
  final String? lengthMin;
  final String? lengthMax;
  final String? weightMin;
  final String? weightMax;
  final String? lifeSpan;
  final String? habitat;
  final String? diet;
  final String? geoRange;
  final String? imageLink;
  final int id;

  const Animal({
    required this.name,
    required this.latinName,
    required this.animalType,
    required this.activeTime,
    required this.lengthMin,
    required this.lengthMax,
    required this.weightMin,
    required this.weightMax,
    required this.lifeSpan,
    required this.habitat,
    required this.diet,
    required this.geoRange,
    required this.imageLink,
    required this.id,
  });

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      name: json['name'],
      latinName: json['latin_name'],
      animalType: json['animal_type'],
      activeTime: json['active_time'],
      lengthMin: json['length_min'],
      lengthMax: json['length_max'],
      weightMin: json['weight_min'],
      weightMax: json['weight_max'],
      lifeSpan: json['life_span'],
      diet: json['diet'],
      habitat: json['habitat'],
      geoRange: json['geo_range'],
      imageLink: json['image_link'],
      id: json['id'],
    );
  }
}
