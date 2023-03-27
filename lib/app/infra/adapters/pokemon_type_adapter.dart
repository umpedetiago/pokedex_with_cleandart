import 'package:poke_dex/app/domain/entities/pokemon_types_entity.dart';

class PokemonTypeAdapter {
  static PokemomTypeEntity fromMap(dynamic data) {
    return PokemomTypeEntity(
      name: data['type']['name'],
      url: data['type']['url'] ?? '',
    );
  }
}
