import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poke_dex/app/external/datasource/pokemon_datasource.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final datasource = PokemonDatasourceImpl(dio);
  test('pokemon datasource Success', () async {
    when(
      () => dio.get(any()),
    ).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(),
        statusCode: 200,
        data: <Map<String, dynamic>>[],
      ),
    );
    final future = await datasource.getAllPokemons();
    expect(future, isA<List<Map<String, dynamic>>>());
  });
  test('pokemon datasource Exception', () {
    when(
      () => dio.get(any()),
    ).thenThrow(Exception());
    final future = datasource.getAllPokemons();
    expect(future, throwsA(isA<Exception>()));
  });

  test('pokemon datasource RequestError', () async {
    when(
      () => dio.get(any()),
    ).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(),
        statusCode: 401,
        data: <Map<String, dynamic>>[],
      ),
    );
    final future = datasource.getAllPokemons();
    expect(future, throwsA(isA<Exception>()));
  });
}
