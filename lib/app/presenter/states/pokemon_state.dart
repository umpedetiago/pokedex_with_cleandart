// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../domain/entities/pokemon_details_entity.dart';

abstract class PokemonState {
  List<PokemonDetailsEntity> pokemonDetails;
  PokemonState({
    required this.pokemonDetails,
  });
}

class PokemonInitialState extends PokemonState {
  PokemonInitialState() : super(pokemonDetails: []);
}

class PokemonSuccessState extends PokemonState {
  PokemonSuccessState({required super.pokemonDetails});
}
