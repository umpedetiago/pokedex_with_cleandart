import '../../domain/entities/pokemon_details_entity.dart';

class PokemonDetailsAdapter {
  static PokemonDetailsEntity fromMap(Map<String, dynamic> data) {
    return PokemonDetailsEntity(
      name: data['name'],
      type: data['type'],
      skill: data['skill'],
      urlImage: data['urlImage'],
    );
  }
}
