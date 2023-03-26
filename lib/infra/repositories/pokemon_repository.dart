import 'package:poke_dex/domain/entities/pokemon_entity.dart';
import 'package:poke_dex/domain/repositories/pokemon_repository.dart';
import 'package:poke_dex/infra/adapters/pokemon_adapter.dart';
import 'package:poke_dex/infra/datasource/pokemon_datasouce.dart';
import 'package:result_dart/result_dart.dart';

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
