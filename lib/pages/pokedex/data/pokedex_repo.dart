// import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'dart:developer';

import 'package:pokecompanion/pages/pokedex/data/my_pokedex_model.dart';
// import '../../../core/repository/api_path.dart';
import '../../../core/repository/api_services.dart';
// import 'pokedex_model.dart';

class PokeDexRepository {
  /// UNCOMMENT THIS IF U USE ORIGINAL POKEAPI
  ///
  // String? urlNext = '';
  // List<Pokemon> pokemonList = [];

  // Future<List<Pokemon>> getPokedexList() async {
  //   final response = await ApiServices()
  //       .getRequest(path: '${APiPath.pokemon}/?offset=0&limit=20');
  //   if (response.statusCode != 200) return [];
  //   urlNext = response.data['next'];

  //   var pokemon = (response.data['results'] as List)
  //       .map((e) => PokedexModel.fromJson(e))
  //       .toList();

  //   for (var e in pokemon) {
  //     final response =
  //         await ApiServices().getRequest(path: '${APiPath.pokemon}/${e.name}');
  //     if (response.statusCode != 200) continue;
  //     pokemonList.add(Pokemon.fromJson(response.data));
  //   }

  //   return pokemonList;
  // }

  // Future<List<Pokemon>> getMorePokedexList() async {
  //   final pathOnly = urlNext!.split('?')[1];
  //   final response =
  //       await ApiServices().getRequest(path: '${APiPath.pokemon}/?$pathOnly');
  //   if (response.statusCode != 200) return [];
  //   urlNext = response.data['next'];
  //   var pokemon = (response.data['results'] as List)
  //       .map((e) => PokedexModel.fromJson(e))
  //       .toList();

  //   for (var e in pokemon) {
  //     final response =
  //         await ApiServices().getRequest(path: '${APiPath.pokemon}/${e.name}');
  //     if (response.statusCode != 200) continue;
  //     pokemonList.add(Pokemon.fromJson(response.data));
  //   }

  //   return pokemonList;
  // }

  /// my original json hosting
  /// https://www.jsonkeeper.com/b/AVET (FREE HOSTING)
  List<MyPokemon> pokemonList = [];
  List<MyPokemon> pokemonSearchList = [];

  Future<List<MyPokemon>> getPokedexList() async {
    final response =
        await ApiServices(activeUrl: 'https://www.jsonkeeper.com/b')
            .getRequest(path: '/AVET');
    // if (response.statusCode != 200) return [];
    log('${response.data}');
    pokemonList =
        (response.data as List).map((e) => MyPokemon.fromJson(e)).toList();
    return pokemonList;
  }

  searchPokemon(String name) {
    pokemonSearchList = pokemonList
        .where((element) =>
            element.name.toLowerCase().contains(name.toLowerCase()))
        .toList();

    return pokemonSearchList;
  }
}
