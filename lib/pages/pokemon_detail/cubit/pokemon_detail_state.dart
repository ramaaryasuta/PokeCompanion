import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokecompanion/pages/pokemon_detail/data/custom_detail_model.dart';

abstract class PokemonDetailState {}

class PokemonDetailInitial extends PokemonDetailState {}

class PokemonDetailLoading extends PokemonDetailState {}

class PokemonDetailLoaded extends PokemonDetailState {
  final Pokemon pokemonDetail;
  final CustomPokemonData otherPokeData;
  List<PokemonEncounter> encounter = [];

  PokemonDetailLoaded(
      {required this.pokemonDetail,
      required this.otherPokeData,
      required this.encounter});
}

class PokemonDetailError extends PokemonDetailState {
  final String errorMsg;

  PokemonDetailError({required this.errorMsg});
}
