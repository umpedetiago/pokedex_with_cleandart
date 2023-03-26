import 'package:dio/dio.dart';

import '../../domain/entities/pokemon_entity.dart';
import '../../infra/datasource/pokemon_details_datasource.dart';

class PokemonDetailsDatasourceImpl implements PokemonDetailsDatasource {
  final Dio dio;

  PokemonDetailsDatasourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> getDetails({
    required PokemonEntity pokemonEntity,
  }) async {
    final response = await dio.get(pokemonEntity.urlDetails);
    if (response.statusCode != 200) {
      throw Exception('Erro na requisição');
    } else {
      return response.data;
    }
  }
}
