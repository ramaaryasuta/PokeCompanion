import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokecompanion/components/network_image.dart';
import 'package:pokecompanion/components/rotating_pokeball.dart';
import 'package:pokecompanion/core/utils/string_extension.dart';
import 'package:pokecompanion/core/utils/ui_helper.dart';
import 'package:pokecompanion/pages/pokemon_detail/data/custom_detail_model.dart';

import '../../../../core/utils/background_color_basetype.dart';
import '../../../pokedex/views/widgets/poke_card.dart';

class PokemonImageContainer extends StatefulWidget {
  const PokemonImageContainer(
      {super.key, required this.pokemon, required this.otherPokeData});

  final Pokemon pokemon;
  final CustomPokemonData otherPokeData;

  @override
  State<PokemonImageContainer> createState() => _PokemonImageContainerState();
}

class _PokemonImageContainerState extends State<PokemonImageContainer> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  void playCries() async {
    await _audioPlayer.play(UrlSource(
      widget.otherPokeData.cries?.latest ??
          widget.otherPokeData.cries?.legacy ??
          '-',
    ));
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Dispose the player when not needed
    super.dispose();
  }

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
            getColorByType(widget.pokemon.types?.first.type?.name ?? 'normal'),
            if ((widget.pokemon.types?.length ?? 0) == 2)
              getColorByType(widget.pokemon.types?.last.type?.name ?? 'normal'),
            if ((widget.pokemon.types?.length ?? 0) == 1)
              getColorByType(widget.pokemon.types?.first.type?.name ?? 'normal')
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
              imageUrl: widget.pokemon.sprites?.frontDefault ?? '-',
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
                      widget.pokemon.name?.capitalizeFirst() ?? '-',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text('#${addZero(widget.pokemon.id!)}',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        for (var typePoke in widget.pokemon.types!)
                          TypeTile(type: typePoke.type!.name!),
                      ],
                    ),
                    buildCriesPlayButton(),
                  ],
                ),
                const Spacer(),
                Row(
                  spacing: 10,
                  children: [
                    buildCardData(context, Icons.height,
                        '${(widget.pokemon.height! / 10)} m'),
                    buildCardData(context, Icons.auto_graph_rounded,
                        '${widget.pokemon.weight} kg'),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Visibility buildCriesPlayButton() {
    return Visibility(
      visible: widget.otherPokeData.cries?.latest != null ||
          widget.otherPokeData.cries?.legacy != null,
      child: InkWell(
        onTap: () {
          playCries();
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: Icon(
            Icons.volume_up_rounded,
            color: getColorByType(
                widget.pokemon.types?.first.type?.name ?? 'normal'),
          ),
        ),
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
