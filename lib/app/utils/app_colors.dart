import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors {
  static Color primary = const Color(0xFFDC0A2D);
  static Color bug = const Color(0xFFA7B723);
  static Color dark = const Color(0xFF75574C);
  static Color dragon = const Color(0xFF7037FF);
  static Color electric = const Color(0xFFF9CF30);
  static Color fairy = const Color(0xFFE69EAC);
  static Color fighting = const Color(0xFFC12239);
  static Color fire = const Color(0xFFF57D31);
  static Color flying = const Color(0xFFA891EC);
  static Color ghost = const Color(0xFF70559B);
  static Color normal = const Color(0xFFAAA67F);
  static Color grass = const Color(0xFF74CB48);
  static Color ground = const Color(0xFFDEC16B);
  static Color ice = const Color(0xFF9AD6DF);
  static Color poison = const Color(0xFFA43E9E);
  static Color psychic = const Color(0xFFFB5584);
  static Color rock = const Color(0xFFB69E31);
  static Color steel = const Color(0xFFB7B9D0);
  static Color water = const Color(0xFF6493EB);

  static Color selectTypeColor(String type) {
    switch (type) {
      case 'bug':
        return bug;
      case 'dark':
        return dark;
      case 'dragon':
        return dragon;
      case 'electric':
        return electric;
      case 'fairy':
        return fairy;
      case 'fighting':
        return fighting;
      case 'fire':
        return fire;
      case 'flying':
        return flying;
      case 'ghost':
        return ghost;
      case 'normal':
        return normal;
      case 'grass':
        return grass;
      case 'ground':
        return ground;
      case 'ice':
        return ice;
      case 'poison':
        return poison;
      case 'psychic':
        return psychic;
      case 'rock':
        return rock;
      case 'steel':
        return steel;
      case 'water':
        return water;
      default:
        return primary;
    }
  }
}
