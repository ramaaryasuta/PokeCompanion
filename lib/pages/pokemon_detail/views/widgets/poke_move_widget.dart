import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokecompanion/core/utils/string_extension.dart';

class PokeMoveWidget extends StatefulWidget {
  const PokeMoveWidget({super.key, required this.pokeData});

  final Pokemon pokeData;

  @override
  State<PokeMoveWidget> createState() => _PokeMoveWidgetState();
}

class _PokeMoveWidgetState extends State<PokeMoveWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
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
          Text('Move', style: Theme.of(context).textTheme.titleLarge!),
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
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: Scrollbar(
                controller: _scrollController,
                scrollbarOrientation: ScrollbarOrientation.top,
                thickness: 5,
                radius: const Radius.circular(5),
                interactive: true,
                child: DataTable(
                  border: TableBorder.all(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black,
                  ),
                  columns: [
                    buildDataColumn(context, title: 'Name'),
                    buildDataColumn(context,
                        title: 'Learn level', isNumeric: true),
                    buildDataColumn(context, title: 'Method'),
                    buildDataColumn(context, title: 'Version name'),
                  ],
                  rows: (widget.pokeData.moves ?? [])
                      .map(
                        (move) => DataRow(
                          cells: [
                            DataCell(Text(move.move!.name
                                    ?.capitalizeFirst()
                                    .replaceAll('-', ' ') ??
                                '-')),
                            DataCell(
                              Text(move
                                      .versionGroupDetails?.first.levelLearnedAt
                                      ?.toString() ??
                                  '-'),
                            ),
                            DataCell(Text(move.versionGroupDetails?.first
                                    .moveLearnMethod?.name ??
                                '-')),
                            DataCell(Text(move.versionGroupDetails?.first
                                    .versionGroup?.name ??
                                '-')),
                          ],
                        ),
                      )
                      .toList(),
                ),
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
