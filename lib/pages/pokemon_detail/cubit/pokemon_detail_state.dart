import 'package:pokeapi/model/pokemon/pokemon.dart';

abstract class PokemonDetailState {}

class PokemonDetailInitial extends PokemonDetailState {}

class PokemonDetailLoading extends PokemonDetailState {}

class PokemonDetailLoaded extends PokemonDetailState {
  final Pokemon pokemonDetail;

  PokemonDetailLoaded({required this.pokemonDetail});
}

class PokemonDetailError extends PokemonDetailState {
  final String errorMsg;

  PokemonDetailError({required this.errorMsg});
}
