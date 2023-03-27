import 'package:result_dart/result_dart.dart';

import '../entities/pokemon_entity.dart';
import '../error/errors.dart';

abstract class PokemonRepository {
  Future<Result<List<PokemonEntity>, FailurePokemon>> fetchPokemons();
}
