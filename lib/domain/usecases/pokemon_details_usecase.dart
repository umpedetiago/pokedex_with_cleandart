import 'package:poke_dex/domain/entities/pokemon_entity.dart';
import 'package:poke_dex/domain/repositories/pokemon_details_repository.dart';
import 'package:result_dart/result_dart.dart';

import '../entities/pokemon_details_entity.dart';

abstract class PokemonDetailsUsecase {
  Future<Result<List<PokemonDetailsEntity>, Exception>> call({
    required PokemonEntity pokemonEntity,
  });
}

class PokemonDetailsUsecaseImpl implements PokemonDetailsUsecase {
  final PokemonDetailsRepository pokemonDetailsRepository;

  PokemonDetailsUsecaseImpl(this.pokemonDetailsRepository);
  @override
  Future<Result<List<PokemonDetailsEntity>, Exception>> call({
    required PokemonEntity pokemonEntity,
  }) {
    return pokemonDetailsRepository.fetchDetails(pokemonEntity: pokemonEntity);
  }
}
