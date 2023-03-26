import 'package:result_dart/result_dart.dart';

import '../../domain/entities/pokemon_entity.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../adapters/pokemon_adapter.dart';
import '../datasource/pokemon_datasouce.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDatasource pokemonDatasource;

  PokemonRepositoryImpl(this.pokemonDatasource);
  @override
  Future<Result<List<PokemonEntity>, Exception>> fetchPokemons() async {
    try {
      final response = await pokemonDatasource.getAllPokemons();
      final result = response.map(PokemonAdapter.fromMap).toList();
      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}
