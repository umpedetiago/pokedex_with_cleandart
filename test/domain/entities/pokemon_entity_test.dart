import 'package:flutter_test/flutter_test.dart';

import 'package:poke_dex/domain/entities/pokemon_entity.dart';

void main() {
  test('pokemon entity ...', () {
    expect(
      PokemonEntity(name: '', urlDetails: ''),
      PokemonEntity(name: '', urlDetails: ''),
    );
  });

  test('pokemon entity hashcode', () {
    expect(
      PokemonEntity(name: '', urlDetails: '').hashCode,
      PokemonEntity(name: '', urlDetails: '').hashCode,
    );
  });
}
