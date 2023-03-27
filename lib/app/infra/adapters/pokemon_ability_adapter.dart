import 'package:poke_dex/app/domain/entities/pokemon_abilities_entity.dart';

class PokemonAbilityAdapter {
  static PokemonAbilityEntity fromMap(dynamic data) {
    return PokemonAbilityEntity(
      name: data['ability']['name'],
      url: data['ability']['url'] ?? '',
    );
  }
}
