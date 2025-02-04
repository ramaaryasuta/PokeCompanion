import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pokedex/cubits/pokedex_cubit.dart';
import '../../pokedex/cubits/pokedex_state.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchPokeState> {
  final PokedexCubit pokedexCubit; // Depend on PokedexCubit

  SearchCubit({required this.pokedexCubit}) : super(SearchInitial());

  void searchPokemon(String query) {
    final pokedexState = pokedexCubit.state;

    if (pokedexState is PokedexLoaded) {
      final filteredPokemon = pokedexState.pokemon
          .where((pokemon) => pokemon.name.contains(query))
          .toList();
      log('filteredPokemon: $filteredPokemon');
      if (filteredPokemon.isEmpty || query.isEmpty) {
        emit(SearchEmpty());
      } else {
        emit(SearchLoaded(pokemon: filteredPokemon));
      }
    }
  }
}
