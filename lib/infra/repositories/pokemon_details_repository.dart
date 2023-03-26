import 'package:poke_dex/domain/entities/pokemon_details_entity.dart';
import 'package:poke_dex/domain/entities/pokemon_entity.dart';
import 'package:poke_dex/domain/repositories/pokemon_details_repository.dart';
import 'package:poke_dex/infra/datasource/pokemon_details_datasource.dart';
import 'package:result_dart/result_dart.dart';

import '../adapters/pokemon_details_adapter.dart';

class PokemonDetailsRepositoryImpl implements PokemonDetailsRepository {
  final PokemonDetailsDatasource pokemonDetailsDatasource;

  PokemonDetailsRepositoryImpl(this.pokemonDetailsDatasource);
  @override
  Future<Result<List<PokemonDetailsEntity>, Exception>> fetchDetails({
    required PokemonEntity pokemonEntity,
  }) async {
    try {
      final response = await pokemonDetailsDatasource.getDetails(
        pokemonEntity: pokemonEntity,
      );
      final result = response.map(PokemonDetailsAdapter.fromMap).toList();
      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}
