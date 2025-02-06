import 'package:flutter/material.dart';
import 'package:pokecompanion/core/utils/string_extension.dart';
import 'package:pokecompanion/core/utils/ui_helper.dart';
import 'package:pokecompanion/pages/pokemon_detail/data/custom_detail_model.dart';

class EncounterAreaWidget extends StatefulWidget {
  const EncounterAreaWidget({super.key, required this.encounterList});

  final List<PokemonEncounter> encounterList;

  @override
  State<EncounterAreaWidget> createState() => _EncounterAreaWidgetState();
}

class _EncounterAreaWidgetState extends State<EncounterAreaWidget> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Encounter Area',
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
            child: widget.encounterList.isEmpty
                ? const Text('No Data')
                : SingleChildScrollView(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      border: TableBorder.all(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black,
                      ),
                      columns: [
                        buildDataColumn(context, title: 'Location Area'),
                        buildDataColumn(context, title: 'Chance'),
                        buildDataColumn(context, title: 'Method'),
                        buildDataColumn(context, title: 'Min : Max Lv.'),
                      ],
                      rows: (widget.encounterList)
                          .map((e) => DataRow(cells: [
                                DataCell(
                                  Container(
                                    constraints: BoxConstraints(
                                        maxWidth: screenWidth(context) * .5),
                                    child: Text(
                                      e.locationArea.name
                                          .replaceAll('-', ' ')
                                          .capitalizeFirst(),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    constraints: BoxConstraints(
                                        maxWidth: screenWidth(context) * .5),
                                    child: Text(
                                        '${e.versionDetails.first.maxChance.toString()}%'),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    constraints: BoxConstraints(
                                        maxWidth: screenWidth(context) * .5),
                                    child: Text(
                                      e.versionDetails.first.encounterDetails
                                          .first.method.name
                                          .replaceAll('-', ' ')
                                          .capitalizeFirst(),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    constraints: BoxConstraints(
                                        maxWidth: screenWidth(context) * .5),
                                    child: Text(
                                      '${e.versionDetails.first.encounterDetails.first.minLevel} : ${e.versionDetails.first.encounterDetails.first.maxLevel}',
                                    ),
                                  ),
                                ),
                              ]))
                          .toList(),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  DataColumn buildDataColumn(BuildContext context,
      {required String title, bool? isNumeric = false}) {
    return DataColumn(
      label: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      numeric: isNumeric!,
    );
  }
}
