import 'package:flutter_test/flutter_test.dart';
import 'package:poke_dex/domain/entities/pokemon_entity.dart';

void main() {
  test('pokemon entity ...', () {
    expect(PokemonEntity(name: '', urlImage: ''),
        PokemonEntity(name: '', urlImage: ''));
  });
}
