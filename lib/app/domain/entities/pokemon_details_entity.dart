// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:poke_dex/app/domain/entities/pokemon_abilities_entity.dart';
import 'package:poke_dex/app/domain/entities/pokemon_stats_entity.dart';
import 'package:poke_dex/app/domain/entities/pokemon_types_entity.dart';

class PokemonDetailsEntity extends Equatable {
  final String name;
  final List<PokemomTypeEntity> type;
  final List<PokemonAbilityEntity> abilities;
  final String urlImage;
  final double weight;
  final double height;
  final List<PokemonStatsEntity> stats;
  const PokemonDetailsEntity({
    required this.name,
    required this.type,
    required this.abilities,
    required this.urlImage,
    required this.weight,
    required this.height,
    required this.stats,
  });

  @override
  List<Object?> get props =>
      [name, type, abilities, urlImage, weight, height, stats];
}
