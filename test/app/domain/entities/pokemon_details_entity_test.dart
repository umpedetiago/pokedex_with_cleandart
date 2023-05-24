import 'package:flutter_test/flutter_test.dart';
import 'package:poke_dex/app/domain/entities/pokemon_abilities_entity.dart';
import 'package:poke_dex/app/domain/entities/pokemon_details_entity.dart';
import 'package:poke_dex/app/domain/entities/pokemon_types_entity.dart';

void main() {
  test('pokemon details entity ...', () {
    expect(
      const PokemonDetailsEntity(
        name: '',
        abilities: <PokemonAbilityEntity>[],
        urlImage: '',
        type: <PokemomTypeEntity>[],
        height: 0,
        weight: 0,
        stats: [],
      ),
      const PokemonDetailsEntity(
        name: '',
        abilities: <PokemonAbilityEntity>[],
        type: <PokemomTypeEntity>[],
        urlImage: '',
        height: 0,
        weight: 0,
        stats: [],
      ),
    );
  });

  test('pokemon details entity hashcode', () {
    expect(
      const PokemonDetailsEntity(
        name: '',
        abilities: <PokemonAbilityEntity>[],
        urlImage: '',
        height: 0,
        weight: 0,
        type: <PokemomTypeEntity>[],
        stats: [],
      ).hashCode,
      const PokemonDetailsEntity(
        name: '',
        abilities: <PokemonAbilityEntity>[],
        type: <PokemomTypeEntity>[],
        urlImage: '',
        height: 0,
        weight: 0,
        stats: [],
      ).hashCode,
    );
  });
}
