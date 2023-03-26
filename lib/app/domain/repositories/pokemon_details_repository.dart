import 'package:result_dart/result_dart.dart';

import '../entities/pokemon_details_entity.dart';
import '../entities/pokemon_entity.dart';

abstract class PokemonDetailsRepository {
  Future<Result<PokemonDetailsEntity, Exception>> fetchDetails({
    required PokemonEntity pokemonEntity,
  });
}
