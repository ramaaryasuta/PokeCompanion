// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:pokecompanion/pages/home/view/home_page.dart' as _i1;
import 'package:pokecompanion/pages/pokemon_detail/views/pokemon_detail_page.dart'
    as _i2;

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomePage();
    },
  );
}

/// generated route for
/// [_i2.PokemonDetailPage]
class PokemonDetailRoute extends _i3.PageRouteInfo<PokemonDetailRouteArgs> {
  PokemonDetailRoute({
    _i4.Key? key,
    required String pokemonName,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          PokemonDetailRoute.name,
          args: PokemonDetailRouteArgs(
            key: key,
            pokemonName: pokemonName,
          ),
          initialChildren: children,
        );

  static const String name = 'PokemonDetailRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PokemonDetailRouteArgs>();
      return _i2.PokemonDetailPage(
        key: args.key,
        pokemonName: args.pokemonName,
      );
    },
  );
}

class PokemonDetailRouteArgs {
  const PokemonDetailRouteArgs({
    this.key,
    required this.pokemonName,
  });

  final _i4.Key? key;

  final String pokemonName;

  @override
  String toString() {
    return 'PokemonDetailRouteArgs{key: $key, pokemonName: $pokemonName}';
  }
}
