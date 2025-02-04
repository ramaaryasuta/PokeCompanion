import '../../pokedex/data/my_pokedex_model.dart';

abstract class SearchPokeState {}

class SearchInitial extends SearchPokeState {}

class SearchLoaded extends SearchPokeState {
  final List<MyPokemon> pokemon;
  SearchLoaded({required this.pokemon});
}

class SearchEmpty extends SearchPokeState {}
