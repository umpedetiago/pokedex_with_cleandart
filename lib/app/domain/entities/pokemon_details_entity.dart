import 'package:equatable/equatable.dart';
import 'package:poke_dex/app/domain/entities/pokemon_abilities_entity.dart';
import 'package:poke_dex/app/domain/entities/pokemon_types_entity.dart';

class PokemonDetailsEntity extends Equatable {
  final String name;
  final List<PokemomTypeEntity> type;
  final List<PokemonAbilityEntity> abilities;
  final String urlImage;
  const PokemonDetailsEntity({
    required this.name,
    required this.type,
    required this.abilities,
    required this.urlImage,
  });

  @override
  List<Object?> get props => [name, type, abilities, urlImage];
}
