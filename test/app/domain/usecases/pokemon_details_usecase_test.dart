import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poke_dex/app/domain/entities/pokemon_details_entity.dart';
import 'package:poke_dex/app/domain/entities/pokemon_entity.dart';
import 'package:poke_dex/app/domain/repositories/pokemon_details_repository.dart';
import 'package:poke_dex/app/domain/usecases/pokemon_details_usecase.dart';

import 'package:result_dart/result_dart.dart';

class PokemonEntityMock extends Mock implements PokemonEntity {}

class PokemonDetailsEntityMock extends Mock implements PokemonDetailsEntity {}

class PokemonDetailsRepositoryMock extends Mock
    implements PokemonDetailsRepository {}

void main() {
  final repository = PokemonDetailsRepositoryMock();
  final usecase = PokemonDetailsUsecaseImpl(repository);
  setUpAll(() {
    registerFallbackValue(PokemonEntityMock());
  });
  test('Should be a list of Pokemon', () async {
    when(
      () => repository.fetchDetails(pokemonEntity: any(named: 'pokemonEntity')),
    ).thenAnswer((_) async => Success(PokemonDetailsEntityMock()));
    final result = await usecase(pokemonEntity: PokemonEntityMock());
    expect(result.getOrNull(), isA<PokemonDetailsEntity>());
  });
}
