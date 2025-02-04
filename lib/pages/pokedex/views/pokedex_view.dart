import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/pokedex_cubit.dart';
import '../cubits/pokedex_state.dart';
import 'widgets/poke_card.dart';

// because this is a view used at navbar
// it not need to be @RoutePage
class PokedexViewScreen extends StatefulWidget {
  const PokedexViewScreen({super.key});

  @override
  State<PokedexViewScreen> createState() => _PokedexViewScreenState();
}

class _PokedexViewScreenState extends State<PokedexViewScreen> {
  late ScrollController _scrollController;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PokedexCubit>().getPokedex();
    });

    // uncomment if using pokeApi
    // _scrollController.addListener(() {
    //   // Detect if the user has reached the bottom of the list
    //   if (_scrollController.position.pixels ==
    //       _scrollController.position.maxScrollExtent) {
    //     // If we are already loading, don't fetch again
    //     if (context.read<PokedexCubit>().state is PokedexLoading) return;

    //     context.read<PokedexCubit>().getMorePokedex();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<PokedexCubit, PokedexState>(
            builder: (context, state) {
              if (state is PokedexInitial) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.red,
                ));
              } else if (state is PokedexLoading && state.pokemon.isEmpty) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.red,
                ));
              } else if (state is PokedexError) {
                return Center(child: Text('Error: ${state.message}'));
              } else if (state is PokedexLoaded) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Stack(
                    children: [
                      GridView.builder(
                        controller: _scrollController,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemCount: state.pokemon.length,
                        itemBuilder: (context, index) {
                          return PokemonCard(pokemon: state.pokemon[index]);
                        },
                      ),
                      if (state.isLoadingMore)
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              } else {
                return const Center(child: Text('Something went wrong'));
              }
            },
          ),
        ),
      ],
    );
  }
}
