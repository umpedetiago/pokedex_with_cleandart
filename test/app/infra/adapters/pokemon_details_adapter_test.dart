import 'package:flutter_test/flutter_test.dart';
import 'package:poke_dex/app/domain/entities/pokemon_details_entity.dart';
import 'package:poke_dex/app/infra/adapters/pokemon_details_adapter.dart';

void main() {
  final data = {
    'name': 'Pikachu',
    'types': [
      {
        'type': {'name': 'electric'}
      },
      {
        'type': {'name': 'normal'}
      },
    ],
    'abilities': [
      {
        'ability': {'name': 'static'}
      },
      {
        'ability': {'name': 'lightning-rod'}
      },
    ],
    'sprites': {
      'front_default':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png'
    },
  };
  test('pokemon details adapter ...', () async {
    final adapter = PokemonDetailsAdapter.fromMap(data);
    expect(adapter, isA<PokemonDetailsEntity>());
  });
}
