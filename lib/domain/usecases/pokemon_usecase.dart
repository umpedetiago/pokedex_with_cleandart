import 'package:poke_dex/domain/entities/pokemon_entity.dart';
import 'package:poke_dex/domain/repositories/pokemon_repository.dart';
import 'package:result_dart/result_dart.dart';

abstract class PokemonUsecase {
  Future<Result<List<PokemonEntity>, Exception>> call();
}

class PokemonUsecaseImpl implements PokemonUsecase {
  final PokemonRepository pokemonRepository;
  PokemonUsecaseImpl(
    this.pokemonRepository,
  );
  @override
  Future<Result<List<PokemonEntity>, Exception>> call() async {
    final response = await pokemonRepository.fetchPokemons();
    return response;
  }
}
