import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokecompanion/pages/pokemon_detail/views/widgets/poke_image_container.dart';

class PokemonDataWidget extends StatelessWidget {
  const PokemonDataWidget({
    super.key,
    required this.pokeData,
  });

  final Pokemon pokeData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 10,
        children: [
          PokemonImageContainer(
            pokemon: pokeData,
          ),
        ],
      ),
    );
  }
}
