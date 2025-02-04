/// this is my model from my own json response
class MyPokemon {
  final int id;
  final String name;
  final List<String> types;
  final String? sprite;
  final String detailsUrl;

  MyPokemon({
    required this.id,
    required this.name,
    required this.types,
    this.sprite,
    required this.detailsUrl,
  });

  // Factory constructor untuk parsing dari JSON
  factory MyPokemon.fromJson(Map<String, dynamic> json) {
    return MyPokemon(
      id: json['id'],
      name: json['name'],
      types: List<String>.from(json['types']),
      sprite: json['sprite'] ?? '-',
      detailsUrl: json['detailsUrl'],
    );
  }
}
