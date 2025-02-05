import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokecompanion/components/network_image.dart';
import 'package:pokecompanion/components/rotating_pokeball.dart';
import 'package:pokecompanion/core/utils/string_extension.dart';
import 'package:pokecompanion/core/utils/ui_helper.dart';

import '../../../../core/utils/background_color_basetype.dart';
import '../../../pokedex/views/widgets/poke_card.dart';

class PokemonImageContainer extends StatelessWidget {
  const PokemonImageContainer({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context) * .4,
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [
            0.5,
            1.0,
          ],
          colors: [
            getColorByType(pokemon.types?.first.type?.name ?? 'normal'),
            if ((pokemon.types?.length ?? 0) == 2)
              getColorByType(pokemon.types?.last.type?.name ?? 'normal'),
            if ((pokemon.types?.length ?? 0) == 1)
              getColorByType(pokemon.types?.first.type?.name ?? 'normal')
                  .withValues(alpha: .5),
          ],
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: RotatingPokeball(),
          ),
          Center(
            child: PNetworkImages(
              imageUrl: pokemon.sprites?.frontDefault ?? '-',
              height: screenHeight(context) * .25,
            ),
          ),
          Container(
            height: double.infinity,
            width: double.maxFinite,
            padding: const EdgeInsets.all(20),
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      pokemon.name?.capitalizeFirst() ?? '-',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text('#${addZero(pokemon.id!)}',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold))
                  ],
                ),
                for (var typePoke in pokemon.types!)
                  TypeTile(type: typePoke.type!.name!),
                const Spacer(),
                Row(
                  spacing: 10,
                  children: [
                    buildCardData(
                        context, Icons.height, '${(pokemon.height! / 10)} m'),
                    buildCardData(context, Icons.auto_graph_rounded,
                        '${pokemon.weight} kg'),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Expanded buildCardData(BuildContext context, IconData icon, String text) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: .2),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white, width: .3),
        ),
        child: Column(
          spacing: 5,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
