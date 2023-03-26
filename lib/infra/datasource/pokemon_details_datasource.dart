import 'package:poke_dex/domain/entities/pokemon_entity.dart';

abstract class PokemonDetailsDatasource {
  Future<List<Map<String, dynamic>>> getDetails({
    required PokemonEntity pokemonEntity,
  });
}
