import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poke_dex/domain/entities/pokemon_entity.dart';
import 'package:poke_dex/domain/repositories/pokemon_repository.dart';
import 'package:poke_dex/domain/usecases/pokemon_usecase.dart';
import 'package:result_dart/result_dart.dart';

class PokemonRepositoryMock extends Mock implements PokemonRepository {}

void main() {
  final repository = PokemonRepositoryMock();
  final usecase = PokemonUsecaseImpl(repository);

  test('Should be a list of Pokemon', () async {
    when(repository.fetchPokemons)
        .thenAnswer((_) async => const Success(<PokemonEntity>[]));
    final result = await usecase();
    expect(result.getOrNull(), isA<List<PokemonEntity>>());
  });
}
