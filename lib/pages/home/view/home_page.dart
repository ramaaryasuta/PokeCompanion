import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:pokecompanion/pages/home/cubit/search_cubit.dart';
import 'package:pokecompanion/pages/pokedex/views/pokedex_view.dart';

import '../../../core/router/app_router.gr.dart';
import '../cubit/search_state.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 1);

  List<Widget> _buildScreens() {
    return [
      Center(child: Text('Home Page', style: TextStyle(fontSize: 24))),
      PokedexViewScreen(),
      Center(child: Text('Profile Page', style: TextStyle(fontSize: 24))),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.games_outlined),
        title: 'Games',
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.catching_pokemon_rounded),
        title: 'Pokémon',
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: 'Profile',
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokémon Companion'),
        actions: [
          if (_controller.index == 1)
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: PokemonSearchDelegate(),
                );
              },
            ),
        ],
      ),
      body: PersistentTabView(
        context,
        controller: _controller,
        onItemSelected: (index) => setState(() {
          _controller.index = index;
        }),
        screens: _buildScreens(),
        items: _navBarsItems(),
        navBarStyle: NavBarStyle.style1,
      ),
    );
  }
}

class PokemonSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Search Pokémon';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // Clear search query
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        query = '';
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    context.read<SearchCubit>().searchPokemon(query); // Trigger search
    return BlocBuilder<SearchCubit, SearchPokeState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return Center(child: CircularProgressIndicator());
        } else if (state is SearchLoaded) {
          final pokemonList = state.pokemon;
          return ListView.builder(
            itemCount: pokemonList.length,
            itemBuilder: (context, index) {
              final pokemon = pokemonList[index];
              return ListTile(
                onTap: () {
                  context.router
                      .push(PokemonDetailRoute(pokemonName: pokemon.name));
                },
                title: Text(pokemon.name),
                subtitle: Text(pokemon.types.join(', ')),
                leading: CachedNetworkImage(
                  imageUrl: pokemon.sprite!,
                  placeholder: (context, url) => CircularProgressIndicator(
                    color: Colors.red,
                    strokeWidth: 1,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              );
            },
          );
        } else if (state is SearchEmpty) {
          return Center(child: Text('No Pokémon found'));
        } else {
          return Center(child: Text('SomeThing Wrong'));
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(); // No suggestions
  }
}
