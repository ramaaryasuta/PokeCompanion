import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/poke_detail_repo.dart';
import 'pokemon_detail_state.dart';

class PokemonDetailCubit extends Cubit<PokemonDetailState> {
  PokemonDetailCubit() : super(PokemonDetailInitial());

  Future<void> getPokemonDetail(String pokemonName) async {
    emit(PokemonDetailLoading());
    try {
      final pokemonDetail =
          await PokemonDetailRepo().getPokemonDetail(pokemonName);
      emit(PokemonDetailLoaded(pokemonDetail: pokemonDetail));
    } catch (e) {
      emit(PokemonDetailError(errorMsg: e.toString()));
    }
  }
}
