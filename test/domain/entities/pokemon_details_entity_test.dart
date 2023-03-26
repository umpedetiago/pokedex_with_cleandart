import 'package:flutter_test/flutter_test.dart';
import 'package:poke_dex/domain/entities/pokemon_details_entity.dart';

void main() {
  test('pokemon details entity ...', () {
    expect(
      PokemonDetailsEntity(name: '', skill: '', urlImage: '', type: ''),
      PokemonDetailsEntity(
        name: '',
        skill: '',
        type: '',
        urlImage: '',
      ),
    );
  });

  test('pokemon details entity hashcode', () {
    expect(
      PokemonDetailsEntity(name: '', skill: '', urlImage: '', type: '')
          .hashCode,
      PokemonDetailsEntity(name: '', skill: '', type: '', urlImage: '')
          .hashCode,
    );
  });
}
