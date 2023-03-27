import 'package:flutter_test/flutter_test.dart';
import 'package:poke_dex/app/domain/entities/pokemon_types_entity.dart';

void main() {
  test('pokemon types entity ...', () async {
    expect(
      const PokemomTypeEntity(name: '', url: '').hashCode,
      const PokemomTypeEntity(name: '', url: '').hashCode,
    );
  });
}
