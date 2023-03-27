import 'package:flutter_test/flutter_test.dart';
import 'package:poke_dex/app/domain/entities/pokemon_entity.dart';

void main() {
  test('pokemon entity ...', () {
    expect(
      const PokemonEntity(name: '', urlDetails: ''),
      const PokemonEntity(name: '', urlDetails: ''),
    );
  });

  test('pokemon entity hashcode', () {
    expect(
      const PokemonEntity(name: '', urlDetails: '').hashCode,
      const PokemonEntity(name: '', urlDetails: '').hashCode,
    );
  });
}
