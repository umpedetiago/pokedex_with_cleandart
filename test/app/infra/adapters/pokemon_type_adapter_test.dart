import 'package:flutter_test/flutter_test.dart';
import 'package:poke_dex/app/domain/entities/pokemon_types_entity.dart';
import 'package:poke_dex/app/infra/adapters/pokemon_type_adapter.dart';

void main() {
  final data = {
    'type': {'name': 'name', 'url': 'url'}
  };
  test('pokemon type adapter ...', () async {
    final adapter = PokemonTypeAdapter.fromMap(data);
    expect(adapter, isA<PokemomTypeEntity>());
  });
}
