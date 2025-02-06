import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/poke_detail_repo.dart';
import 'pokemon_detail_state.dart';

class PokemonDetailCubit extends Cubit<PokemonDetailState> {
  PokemonDetailCubit() : super(PokemonDetailInitial());

  Future<void> getPokemonDetail(int pokemonId) async {
    emit(PokemonDetailLoading());
    try {
      final pokemonDetail =
          await PokemonDetailRepo().getPokemonDetail(pokemonId);
      final otherData =
          await PokemonDetailRepo().getAnotherDataPokemon(pokemonId);
      final encounterData = await PokemonDetailRepo().getEncounter(pokemonId);
      emit(PokemonDetailLoaded(
        pokemonDetail: pokemonDetail,
        otherPokeData: otherData,
        encounter: encounterData,
      ));
    } catch (e) {
      emit(PokemonDetailError(errorMsg: e.toString()));
    }
  }
}
