import 'package:flutter/material.dart';

Color getColorByType(String type) {
  switch (type) {
    case 'normal':
      return Colors.grey;
    case 'grass':
      return Colors.green;
    case 'fire':
      return Colors.red;
    case 'water':
      return Colors.blue;
    case 'bug':
      return Colors.lightGreen;
    case 'flying':
      return Colors.grey.shade600;
    case 'poison':
      return Colors.purple.shade400;
    case 'ghost':
      return Colors.deepPurple;
    case 'dark':
      return Colors.black54;
    case 'electric':
      return Colors.yellow.shade700;
    case 'ground':
      return Colors.brown.shade300;
    case 'rock':
      return Colors.brown;
    case 'psychic':
      return Colors.pink.shade400;
    case 'fairy':
      return Colors.pink.shade200;
    case 'steel':
      return Colors.blueGrey;
    case 'ice':
      return Colors.cyanAccent.shade700;
    case 'fighting':
      return Colors.redAccent;
    case 'dragon':
      return Colors.indigo;
    default:
      return Colors.black;
  }
}
