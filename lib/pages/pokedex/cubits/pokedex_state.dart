// import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokecompanion/pages/pokedex/data/my_pokedex_model.dart';

abstract class PokedexState {}

class PokedexInitial extends PokedexState {}

class PokedexLoading extends PokedexState {
  // uncomment if using pokeAPi for list
  // final List<Pokemon> pokemon;
  // PokedexLoading({this.pokemon = const []});

  final List<MyPokemon> pokemon;
  PokedexLoading({this.pokemon = const []});
}

class PokedexLoaded extends PokedexState {
  // final List<Pokemon> pokemon;
  // final bool isLoadingMore;

  // PokedexLoaded({required this.pokemon, this.isLoadingMore = false});

  final List<MyPokemon> pokemon;
  final bool isLoadingMore;

  PokedexLoaded({required this.pokemon, this.isLoadingMore = false});
}

class PokedexError extends PokedexState {
  final String message;
  PokedexError({required this.message});
}

class PokedexSearch extends PokedexState {
  final List<MyPokemon> pokemon;
  PokedexSearch({required this.pokemon});
}
