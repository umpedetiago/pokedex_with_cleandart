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
      ),
      const PokemonDetailsEntity(
        name: '',
        abilities: <PokemonAbilityEntity>[],
        type: <PokemomTypeEntity>[],
        urlImage: '',
      ),
    );
  });

  test('pokemon details entity hashcode', () {
    expect(
      const PokemonDetailsEntity(
        name: '',
        abilities: <PokemonAbilityEntity>[],
        urlImage: '',
        type: <PokemomTypeEntity>[],
      ).hashCode,
      const PokemonDetailsEntity(
        name: '',
        abilities: <PokemonAbilityEntity>[],
        type: <PokemomTypeEntity>[],
        urlImage: '',
      ).hashCode,
    );
  });
}
