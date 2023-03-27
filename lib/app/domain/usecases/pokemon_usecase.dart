import 'package:poke_dex/app/domain/error/errors.dart';
import 'package:result_dart/result_dart.dart';

import '../entities/pokemon_entity.dart';
import '../repositories/pokemon_repository.dart';

abstract class PokemonUsecase {
  Future<Result<List<PokemonEntity>, FailurePokemon>> call();
}

class PokemonUsecaseImpl implements PokemonUsecase {
  final PokemonRepository pokemonRepository;
  PokemonUsecaseImpl(
    this.pokemonRepository,
  );
  @override
  Future<Result<List<PokemonEntity>, FailurePokemon>> call() async {
    return pokemonRepository.fetchPokemons().map((success) => success);
  }
}
