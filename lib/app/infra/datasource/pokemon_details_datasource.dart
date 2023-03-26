import '../../domain/entities/pokemon_entity.dart';

abstract class PokemonDetailsDatasource {
  Future<Map<String, dynamic>> getDetails({
    required PokemonEntity pokemonEntity,
  });
}
