import 'package:result_dart/result_dart.dart';

import '../entities/pokemon_details_entity.dart';
import '../entities/pokemon_entity.dart';
import '../repositories/pokemon_details_repository.dart';

abstract class PokemonDetailsUsecase {
  Future<Result<PokemonDetailsEntity, Exception>> call({
    required PokemonEntity pokemonEntity,
  });
}

class PokemonDetailsUsecaseImpl implements PokemonDetailsUsecase {
  final PokemonDetailsRepository pokemonDetailsRepository;

  PokemonDetailsUsecaseImpl(this.pokemonDetailsRepository);
  @override
  Future<Result<PokemonDetailsEntity, Exception>> call({
    required PokemonEntity pokemonEntity,
  }) {
    return pokemonDetailsRepository.fetchDetails(pokemonEntity: pokemonEntity);
  }
}
