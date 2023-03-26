import 'package:flutter_test/flutter_test.dart';
import 'package:poke_dex/app/domain/entities/pokemon_details_entity.dart';

void main() {
  test('pokemon details entity ...', () {
    expect(
      const PokemonDetailsEntity(name: '', skill: '', urlImage: '', type: ''),
      const PokemonDetailsEntity(
        name: '',
        skill: '',
        type: '',
        urlImage: '',
      ),
    );
  });

  test('pokemon details entity hashcode', () {
    expect(
      const PokemonDetailsEntity(name: '', skill: '', urlImage: '', type: '')
          .hashCode,
      const PokemonDetailsEntity(name: '', skill: '', type: '', urlImage: '')
          .hashCode,
    );
  });
}
