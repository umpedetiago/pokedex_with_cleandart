import 'package:flutter_test/flutter_test.dart';
import 'package:poke_dex/domain/entities/pokemon_entity.dart';
import 'package:poke_dex/infra/adapters/pokemon_adapter.dart';

void main() {
  final data = <String, dynamic>{'name': 'name', 'url': 'url'};
  test('pokemon adapter ...', () async {
    final adapter = PokemonAdapter.fromMap(data);
    expect(adapter, isA<PokemonEntity>());
  });
}
