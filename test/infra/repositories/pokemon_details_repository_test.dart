import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poke_dex/domain/entities/pokemon_details_entity.dart';
import 'package:poke_dex/infra/datasource/pokemon_details_datasource.dart';
import 'package:poke_dex/infra/repositories/pokemon_details_repository.dart';

import '../../domain/usecases/pokemon_details_usecase_test.dart';

class PokemonDetailsDatasourceMock extends Mock
    implements PokemonDetailsDatasource {}

void main() {
  final datasource = PokemonDetailsDatasourceMock();
  final repository = PokemonDetailsRepositoryImpl(datasource);
  setUpAll(() {
    registerFallbackValue(PokemonEntityMock());
  });
  test('pokemon details repository ...', () async {
    when(
      () => datasource.getDetails(pokemonEntity: any(named: 'pokemonEntity')),
    ).thenAnswer((_) async => <Map<String, dynamic>>[]);
    final result = await repository.fetchDetails(
      pokemonEntity: PokemonEntityMock(),
    );
    expect(result.getOrNull(), isA<List<PokemonDetailsEntity>>());
  });

  test('pokemon details exception', () async {
    when(
      () => datasource.getDetails(pokemonEntity: any(named: 'pokemonEntity')),
    ).thenThrow(Exception());
    final result = await repository.fetchDetails(
      pokemonEntity: PokemonEntityMock(),
    );
    expect(result.exceptionOrNull(), isA<Exception>());
  });
}
