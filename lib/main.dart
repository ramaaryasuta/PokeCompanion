import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'gen/fonts.gen.dart';

import 'core/router/app_router.dart';
import 'pages/home/cubit/search_cubit.dart';
import 'pages/pokedex/cubits/pokedex_cubit.dart';
import 'pages/pokemon_detail/cubit/pokemon_detail_cubit.dart';

void main() {
  runZonedGuarded(() {
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<PokedexCubit>(create: (context) => PokedexCubit()),
          BlocProvider<SearchCubit>(
              create: (context) =>
                  SearchCubit(pokedexCubit: context.read<PokedexCubit>())),
          BlocProvider<PokemonDetailCubit>(
              create: (context) => PokemonDetailCubit()),
        ],
        child: MyApp(),
      ),
    );
  }, (r, s) {
    log(
      'Error runZonedGuarded: $r\n$s',
      stackTrace: s,
    );
  });
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: FontFamily.pixelify,
      ),
    );
  }
}
