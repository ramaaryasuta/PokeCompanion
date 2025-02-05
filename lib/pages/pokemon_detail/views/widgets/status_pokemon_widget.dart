import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokecompanion/core/utils/string_extension.dart';

class StatusPokemonWidget extends StatelessWidget {
  const StatusPokemonWidget({super.key, required this.pokeData});

  final Pokemon pokeData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${pokeData.name?.capitalizeFirst()} Base Status',
              style: Theme.of(context).textTheme.titleLarge!),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white, width: .3),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: .2),
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                )
              ],
            ),
            child: Column(
              spacing: 5,
              children: [
                for (var status in pokeData.stats ?? [])
                  buildStatus(context,
                      label: status.stat?.name ?? '',
                      value: status.baseStat!.toDouble() ?? 0),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row buildStatus(
    BuildContext context, {
    required String label,
    required double value,
  }) {
    return Row(
      spacing: 10,
      children: [
        Expanded(
          flex: 3,
          child: Text(label.replaceAll('special', 'sp').capitalizeFirst()),
        ),
        Expanded(
          flex: 5,
          child: LinearProgressIndicator(
            value: (value) / 250,
            color: colorBar(value.toInt()),
            backgroundColor: Colors.grey.withValues(alpha: .2),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(value.toInt().toString()),
        ),
      ],
    );
  }

  colorBar(int value) {
    if (value < 100) {
      return Colors.red;
    }
    if (value < 140) {
      return Colors.amber;
    }
    return Colors.green;
  }
}
