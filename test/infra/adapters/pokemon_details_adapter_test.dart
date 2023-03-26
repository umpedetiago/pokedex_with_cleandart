import 'package:flutter_test/flutter_test.dart';
import 'package:poke_dex/app/domain/entities/pokemon_details_entity.dart';
import 'package:poke_dex/app/infra/adapters/pokemon_details_adapter.dart';

void main() {
  final data = <String, dynamic>{
    'name': 'name',
    'type': 'type',
    'skill': 'skill',
    'urlImage': 'urlImage'
  };
  test('pokemon details adapter ...', () async {
    final adapter = PokemonDetailsAdapter.fromMap(data);
    expect(adapter, isA<PokemonDetailsEntity>());
  });
}
