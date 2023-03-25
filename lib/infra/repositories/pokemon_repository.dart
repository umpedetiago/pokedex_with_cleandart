import 'package:poke_dex/domain/entities/pokemon_entity.dart';
import 'package:poke_dex/domain/repositories/pokemon_repository.dart';
import 'package:poke_dex/infra/adapters/pokemon_adapter.dart';
import 'package:poke_dex/infra/datasource/pokemon_datasouce.dart';
import 'package:result_dart/result_dart.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDatasouce pokemonDatasouce;

  PokemonRepositoryImpl(this.pokemonDatasouce);
  @override
  Future<Result<List<PokemonEntity>, Exception>> fetchPokemons() async {
    try {
      final response = await pokemonDatasouce.getAllPokemons();
      final result = response.map((e) => PokemonAdapter.fromMap(e)).toList();
      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}
