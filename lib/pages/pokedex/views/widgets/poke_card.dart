import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pokecompanion/components/network_image.dart';
import 'package:pokecompanion/core/router/app_router.gr.dart';
// import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokecompanion/pages/pokedex/data/my_pokedex_model.dart';

import '../../../../core/utils/background_color_basetype.dart';
import '../../../../core/utils/string_extension.dart';
import '../../../../core/utils/ui_helper.dart';
import '../../../../gen/assets.gen.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemon});

  // final Pokemon pokemon;
  final MyPokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(PokemonDetailRoute(pokemonId: pokemon.id));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [
              0.5,
              1.0,
            ],
            colors: [
              // getColorByType(pokemon.types?.first.type?.name ?? 'normal'),
              // if ((pokemon.types?.length ?? 0) == 2)
              //   getColorByType(pokemon.types?.last.type?.name ?? 'normal'),
              // if ((pokemon.types?.length ?? 0) == 1)
              //   getColorByType(pokemon.types?.first.type?.name ?? 'normal')
              //       .withValues(alpha: .5),
              getColorByType(pokemon.types.first),
              if ((pokemon.types.length) == 2)
                getColorByType(pokemon.types.last),
              if ((pokemon.types.length) == 1)
                getColorByType(pokemon.types.first).withValues(alpha: .5),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: .2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Opacity(
              opacity: .1,
              child: Image.asset(
                height: screenHeight(context) * .15,
                Assets.images.pokeball.path,
              ),
            ),
            PNetworkImages(imageUrl: pokemon.sprite!, height: 100),
            SizedBox(
              width: double.maxFinite,
              child: Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(pokemon.name.capitalizeFirst(),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  Text('#${addZero(pokemon.id)}',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white)),
                  for (var typePoke in pokemon.types) TypeTile(type: typePoke),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TypeTile extends StatelessWidget {
  const TypeTile({
    super.key,
    required this.type,
  });

  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: .2),
        border: Border.all(color: Colors.white, width: .3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: getColorByType(type),
              border: Border.all(color: Colors.white),
              shape: BoxShape.circle,
            ),
          ),
          Text(
            type,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w100),
          )
        ],
      ),
    );
  }
}
