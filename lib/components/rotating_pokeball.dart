import 'package:flutter/material.dart';
import 'package:pokecompanion/core/utils/ui_helper.dart';
import 'package:pokecompanion/gen/assets.gen.dart';

class RotatingPokeball extends StatefulWidget {
  const RotatingPokeball({super.key});

  @override
  State<RotatingPokeball> createState() => _RotatingPokeballState();
}

class _RotatingPokeballState extends State<RotatingPokeball>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 30),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Opacity(
        opacity: .2,
        child: Image.asset(
          Assets.images.pokeball.path,
          width: screenHeight(context) * .3,
        ),
      ),
    );
  }
}
