import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poke_dex/app/domain/entities/pokemon_details_entity.dart';
import 'package:poke_dex/app/domain/error/errors.dart';
import 'package:poke_dex/app/infra/datasource/pokemon_details_datasource.dart';
import 'package:poke_dex/app/infra/repositories/pokemon_details_repository.dart';
import '../../domain/usecases/pokemon_details_usecase_test.dart';

class PokemonDetailsDatasourceMock extends Mock
    implements PokemonDetailsDatasource {}

void main() {
  final datasource = PokemonDetailsDatasourceMock();
  final repository = PokemonDetailsRepositoryImpl(datasource);
  final pokemonDetailsMap = <String, dynamic>{
    'name': 'Pikachu',
    'types': [
      {
        'type': {'name': 'electric'}
      },
      {
        'type': {'name': 'normal'}
      },
    ],
    'abilities': [
      {
        'ability': {'name': 'static'}
      },
      {
        'ability': {'name': 'lightning-rod'}
      },
    ],
    'sprites': {
      'front_default':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png'
    },
  };

  setUpAll(() {
    registerFallbackValue(PokemonEntityMock());
  });
  test('pokemon details repository ...', () async {
    when(
      () => datasource.getDetails(pokemonEntity: any(named: 'pokemonEntity')),
    ).thenAnswer((_) async => pokemonDetailsMap);
    final result = await repository.fetchDetails(
      pokemonEntity: PokemonEntityMock(),
    );
    expect(result.getOrNull(), isA<PokemonDetailsEntity>());
  });

  test('pokemon details exception', () async {
    when(
      () => datasource.getDetails(pokemonEntity: any(named: 'pokemonEntity')),
    ).thenThrow(FailurePokemon(menssage: ''));
    final result = await repository.fetchDetails(
      pokemonEntity: PokemonEntityMock(),
    );
    expect(result.exceptionOrNull(), isA<FailurePokemon>());
  });
}
