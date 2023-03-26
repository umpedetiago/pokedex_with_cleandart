import 'package:dio/dio.dart';
import 'package:poke_dex/infra/datasource/pokemon_datasouce.dart';
import 'package:poke_dex/utils/base_url.dart';

class PokemonDatasourceImpl implements PokemonDatasource {
  final Dio dio;

  PokemonDatasourceImpl(this.dio);
  @override
  Future<List<Map<String, dynamic>>> getAllPokemons() async {
    final response = await dio.get(BaseUrl.ALL_POKEMONS);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Erro na requisição');
    }
  }
}
