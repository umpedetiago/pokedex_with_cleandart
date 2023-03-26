import 'package:poke_dex/domain/entities/pokemon_entity.dart';

class PokemonAdapter {
  static PokemonEntity fromMap(Map<String, dynamic> data) {
    return PokemonEntity(name: data['name'], urlDetails: data['url']);
  }
}
