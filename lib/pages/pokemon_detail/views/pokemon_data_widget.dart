import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokecompanion/pages/pokemon_detail/data/custom_detail_model.dart';
import 'package:pokecompanion/pages/pokemon_detail/views/widgets/encounter_area_widget.dart';
import 'package:pokecompanion/pages/pokemon_detail/views/widgets/poke_move_widget.dart';
import 'package:pokecompanion/pages/pokemon_detail/views/widgets/status_pokemon_widget.dart';
import 'widgets/poke_image_container.dart';

class PokemonDataWidget extends StatelessWidget {
  const PokemonDataWidget({
    super.key,
    required this.pokeData,
    required this.otherData,
    required this.encounter,
  });

  final Pokemon pokeData;
  final CustomPokemonData otherData;
  final List<PokemonEncounter> encounter;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 10,
        children: [
          PokemonImageContainer(pokemon: pokeData, otherPokeData: otherData),
          StatusPokemonWidget(pokeData: pokeData),
          EncounterAreaWidget(encounterList: encounter),
          PokeMoveWidget(pokeData: pokeData),
        ],
      ),
    );
  }
}
