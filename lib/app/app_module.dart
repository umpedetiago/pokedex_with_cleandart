import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_dex/app/domain/usecases/pokemon_details_usecase.dart';
import 'package:poke_dex/app/domain/usecases/pokemon_usecase.dart';
import 'package:poke_dex/app/external/datasource/pokemon_datasource.dart';
import 'package:poke_dex/app/external/datasource/pokemon_details_datasource.dart';
import 'package:poke_dex/app/infra/repositories/pokemon_details_repository.dart';
import 'package:poke_dex/app/infra/repositories/pokemon_repository.dart';
import 'package:poke_dex/app/presenter/pages/home_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => PokemonDetailsDatasourceImpl(i())),
        Bind((i) => PokemonDetailsRepositoryImpl(i())),
        Bind((i) => PokemonDetailsUsecaseImpl(i())),
        Bind((i) => PokemonDatasourceImpl(i())),
        Bind((i) => PokemonRepositoryImpl(i())),
        Bind((i) => PokemonUsecaseImpl(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
      ];
}
