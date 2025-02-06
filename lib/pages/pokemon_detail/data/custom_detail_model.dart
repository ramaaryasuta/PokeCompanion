class CustomPokemonData {
  String? locationAreaEncounter;
  Cries? cries;

  CustomPokemonData({
    this.locationAreaEncounter,
    this.cries,
  });

  factory CustomPokemonData.fromJson(Map<String, dynamic> json) {
    return CustomPokemonData(
      locationAreaEncounter: json['location_area_encounters'] ?? '-',
      cries: json['cries'] != null ? Cries.fromJson(json['cries']) : null,
    );
  }
}

class Cries {
  String? latest;
  String? legacy;

  Cries({this.latest, this.legacy});

  factory Cries.fromJson(Map<String, dynamic> json) {
    return Cries(
      latest: json['latest'],
      legacy: json['legacy'],
    );
  }
}

class PokemonEncounter {
  final LocationArea locationArea;
  final List<VersionDetail> versionDetails;

  PokemonEncounter({
    required this.locationArea,
    required this.versionDetails,
  });

  factory PokemonEncounter.fromJson(Map<String, dynamic> json) {
    var versionDetailsList = json['version_details'] as List;
    List<VersionDetail> versionDetails = versionDetailsList
        .map((detail) => VersionDetail.fromJson(detail))
        .toList();

    return PokemonEncounter(
      locationArea: LocationArea.fromJson(json['location_area']),
      versionDetails: versionDetails,
    );
  }
}

class LocationArea {
  final String name;
  final String url;

  LocationArea({
    required this.name,
    required this.url,
  });

  factory LocationArea.fromJson(Map<String, dynamic> json) {
    return LocationArea(
      name: json['name'],
      url: json['url'],
    );
  }
}

class VersionDetail {
  final List<EncounterDetail> encounterDetails;
  final int maxChance;
  final Version version;

  VersionDetail({
    required this.encounterDetails,
    required this.maxChance,
    required this.version,
  });

  factory VersionDetail.fromJson(Map<String, dynamic> json) {
    var encounterDetailsList = json['encounter_details'] as List;
    List<EncounterDetail> encounterDetails = encounterDetailsList
        .map((detail) => EncounterDetail.fromJson(detail))
        .toList();

    return VersionDetail(
      encounterDetails: encounterDetails,
      maxChance: json['max_chance'],
      version: Version.fromJson(json['version']),
    );
  }
}

class EncounterDetail {
  final int chance;
  final List<dynamic>
      conditionValues; // Assuming condition_values can be any type
  final int maxLevel;
  final EncounterMethod method;
  final int minLevel;

  EncounterDetail({
    required this.chance,
    required this.conditionValues,
    required this.maxLevel,
    required this.method,
    required this.minLevel,
  });

  factory EncounterDetail.fromJson(Map<String, dynamic> json) {
    return EncounterDetail(
      chance: json['chance'],
      conditionValues: json['condition_values'],
      maxLevel: json['max_level'],
      method: EncounterMethod.fromJson(json['method']),
      minLevel: json['min_level'],
    );
  }
}

class EncounterMethod {
  final String name;
  final String url;

  EncounterMethod({
    required this.name,
    required this.url,
  });

  factory EncounterMethod.fromJson(Map<String, dynamic> json) {
    return EncounterMethod(
      name: json['name'],
      url: json['url'],
    );
  }
}

class Version {
  final String name;
  final String url;

  Version({
    required this.name,
    required this.url,
  });

  factory Version.fromJson(Map<String, dynamic> json) {
    return Version(
      name: json['name'],
      url: json['url'],
    );
  }
}
