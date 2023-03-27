import 'package:poke_dex/app/infra/adapters/pokemon_ability_adapter.dart';
import 'package:poke_dex/app/infra/adapters/pokemon_type_adapter.dart';

import '../../domain/entities/pokemon_details_entity.dart';

class PokemonDetailsAdapter {
  static PokemonDetailsEntity fromMap(Map<String, dynamic> data) {
    return PokemonDetailsEntity(
      name: data['name'],
      type: (data['types'] as List).map(PokemonTypeAdapter.fromMap).toList(),
      abilities: (data['abilities'] as List)
          .map(PokemonAbilityAdapter.fromMap)
          .toList(),
      urlImage: data['sprites']['front_default'],
    );
  }
}
