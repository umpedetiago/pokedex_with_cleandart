import 'package:result_dart/result_dart.dart';

import '../../domain/entities/pokemon_details_entity.dart';
import '../../domain/entities/pokemon_entity.dart';
import '../../domain/error/errors.dart';
import '../../domain/repositories/pokemon_details_repository.dart';
import '../adapters/pokemon_details_adapter.dart';
import '../datasource/pokemon_details_datasource.dart';

class PokemonDetailsRepositoryImpl implements PokemonDetailsRepository {
  final PokemonDetailsDatasource pokemonDetailsDatasource;

  PokemonDetailsRepositoryImpl(this.pokemonDetailsDatasource);
  @override
  Future<Result<PokemonDetailsEntity, FailurePokemon>> fetchDetails({
    required PokemonEntity pokemonEntity,
  }) async {
    try {
      final response = await pokemonDetailsDatasource.getDetails(
        pokemonEntity: pokemonEntity,
      );
      final result = PokemonDetailsAdapter.fromMap(response);
      return Result.success(result);
    } on FailurePokemon catch (e) {
      return Result.failure(e);
    }
  }
}
