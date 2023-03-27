import 'package:flutter_test/flutter_test.dart';
import 'package:poke_dex/app/domain/entities/pokemon_abilities_entity.dart';

void main() {
  test('pokemon abilities entity ...', () async {
    expect(
      const PokemonAbilityEntity(name: '', url: '').hashCode,
      const PokemonAbilityEntity(name: '', url: '').hashCode,
    );
  });
}
