import 'package:flutter_test/flutter_test.dart';
import 'package:poke_dex/app/domain/entities/pokemon_abilities_entity.dart';

import 'package:poke_dex/app/infra/adapters/pokemon_ability_adapter.dart';

void main() {
  final data = {
    'ability': {'name': 'name', 'url': 'url'}
  };
  test('pokemon ability adapter ...', () async {
    final adapter = PokemonAbilityAdapter.fromMap(data);
    expect(adapter, isA<PokemonAbilityEntity>());
  });
}
