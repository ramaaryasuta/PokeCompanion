import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokecompanion/components/loading_widget.dart';

import '../cubit/pokemon_detail_cubit.dart';
import '../cubit/pokemon_detail_state.dart';
import 'pokemon_data_widget.dart';

@RoutePage()
class PokemonDetailPage extends StatefulWidget {
  const PokemonDetailPage({super.key, required this.pokemonId});

  final int pokemonId;

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        context.read<PokemonDetailCubit>().getPokemonDetail(widget.pokemonId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokemon Detail')),
      body: BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
          builder: (context, state) {
        if (state is PokemonDetailLoading) {
          return const Center(child: PLoadingWidget());
        } else if (state is PokemonDetailError) {
          return Center(child: Text(state.errorMsg));
        } else if (state is PokemonDetailLoaded) {
          return PokemonDataWidget(pokeData: state.pokemonDetail);
        } else {
          return const Center(child: Text('SomeThing Wrong'));
        }
      }),
    );
  }
}
