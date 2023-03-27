import 'package:dio/dio.dart';
import 'package:poke_dex/app/domain/error/errors.dart';

import '../../infra/datasource/pokemon_datasouce.dart';
import '../../utils/base_url.dart';

class PokemonDatasourceImpl implements PokemonDatasource {
  final Dio dio;

  PokemonDatasourceImpl(this.dio);
  @override
  Future<List<Map<String, dynamic>>> getAllPokemons() async {
    final response = await dio.get(BaseUrl.ALL_POKEMONS);
    if (response.statusCode != 200) {
      throw FailurePokemon(menssage: 'Erro na requisição');
    }
    final result = List<Map<String, dynamic>>.from(response.data['results']);
    return result;
  }
}
