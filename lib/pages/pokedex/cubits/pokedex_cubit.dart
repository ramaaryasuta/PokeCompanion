import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokecompanion/pages/pokedex/data/my_pokedex_model.dart';
// import 'package:pokeapi/model/pokemon/pokemon.dart';

import '../data/pokedex_repo.dart';
import 'pokedex_state.dart';

class PokedexCubit extends Cubit<PokedexState> {
  List<MyPokemon> pokemonListCubit = [];

  final PokeDexRepository _repository = PokeDexRepository();
  // bool _isFetchingMore = false;

  PokedexCubit() : super(PokedexInitial());

  Future<void> getPokedex() async {
    try {
      emit(PokedexLoading());
      final pokemonList = await _repository.getPokedexList();
      pokemonListCubit = List.from(pokemonList);
      emit(PokedexLoaded(pokemon: pokemonList, isLoadingMore: false));
    } catch (e) {
      emit(PokedexError(message: e.toString()));
    }
  }

  searchPokemonLocal(String name) async {
    final searchPoke = await _repository.searchPokemon(name);
    emit(PokedexSearch(pokemon: searchPoke));
  }

  // Future<void> getMorePokedex() async {
  //   if (_isFetchingMore) return; // 🚨 Cegah fetch berulang jika sedang loading
  //   _isFetchingMore = true;
  //   try {
  //     final currentState = state;
  //     if (currentState is PokedexLoaded) {
  //       // Menandai data lebih lanjut sedang dimuat
  //       emit(PokedexLoaded(pokemon: currentState.pokemon, isLoadingMore: true));

  //       // Mendapatkan data baru
  //       final morePokemon = await _repository.getMorePokedexList();

  //       // Menggabungkan data lama dan baru tanpa duplikasi
  //       final updatedPokemonList = List<Pokemon>.from(currentState.pokemon);

  //       // Menambahkan data baru yang belum ada dalam list
  //       for (var newPokemon in morePokemon) {
  //         if (!updatedPokemonList
  //             .any((pokemon) => pokemon.name == newPokemon.name)) {
  //           updatedPokemonList.add(newPokemon);
  //         }
  //       }

  //       // Emit data baru
  //       emit(PokedexLoaded(pokemon: updatedPokemonList, isLoadingMore: false));
  //     }
  //   } catch (e) {
  //     emit(PokedexError(message: e.toString()));
  //   } finally {
  //     _isFetchingMore = false;
  //   }
  // }
}
