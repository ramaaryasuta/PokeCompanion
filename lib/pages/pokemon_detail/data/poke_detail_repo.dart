import 'dart:developer';

import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokecompanion/pages/pokemon_detail/data/custom_detail_model.dart';

import '../../../core/repository/api_services.dart';
import '../../../core/repository/api_path.dart';

class PokemonDetailRepo {
  Future<Pokemon> getPokemonDetail(int pokemonId) async {
    final response =
        await ApiServices().getRequest(path: '${APiPath.pokemon}/$pokemonId');
    var pokemonDetail = Pokemon.fromJson(response.data);
    return pokemonDetail;
  }

  Future<CustomPokemonData> getAnotherDataPokemon(int pokemonId) async {
    final response =
        await ApiServices().getRequest(path: '${APiPath.pokemon}/$pokemonId');
    var otherPokeData = CustomPokemonData.fromJson(response.data);
    return otherPokeData;
  }

  Future<List<PokemonEncounter>> getEncounter(int pokemonId) async {
    final response = await ApiServices()
        .getRequest(path: '${APiPath.pokemon}/$pokemonId/${APiPath.encounter}');
    var encounter = (response.data as List)
        .map((e) => PokemonEncounter.fromJson(e))
        .toList();
    log('encounter: $encounter');
    return encounter;
  }
}
