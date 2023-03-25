import 'package:poke_dex/domain/entities/pokemon_entity.dart';
import 'package:result_dart/result_dart.dart';

abstract class PokemonRepository {
  Future<Result<List<PokemonEntity>, Exception>> fetchPokemons();
}
