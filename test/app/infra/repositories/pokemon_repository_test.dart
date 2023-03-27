import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poke_dex/app/domain/entities/pokemon_entity.dart';
import 'package:poke_dex/app/domain/error/errors.dart';
import 'package:poke_dex/app/infra/datasource/pokemon_datasouce.dart';
import 'package:poke_dex/app/infra/repositories/pokemon_repository.dart';

class PokemonDatasouceMock extends Mock implements PokemonDatasource {}

void main() {
  final pokemonDatasource = PokemonDatasouceMock();
  final repository = PokemonRepositoryImpl(pokemonDatasource);
  test('pokemon repository Success', () async {
    when(pokemonDatasource.getAllPokemons)
        .thenAnswer((_) async => <Map<String, dynamic>>[]);
    final response = await repository.fetchPokemons();
    expect(response.getOrNull(), isA<List<PokemonEntity>>());
  });

  test('pokemon repository Exception', () async {
    when(pokemonDatasource.getAllPokemons)
        .thenThrow(FailurePokemon(menssage: ''));
    final response = await repository.fetchPokemons();
    expect(response.exceptionOrNull(), isA<FailurePokemon>());
  });
}
