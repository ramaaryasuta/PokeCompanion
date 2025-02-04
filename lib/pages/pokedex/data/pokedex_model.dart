class PokedexModel {
  String name;
  String url;

  PokedexModel({required this.name, required this.url});

  factory PokedexModel.fromJson(Map<String, dynamic> json) {
    return PokedexModel(
      name: json['name'],
      url: json['url'],
    );
  }
}
