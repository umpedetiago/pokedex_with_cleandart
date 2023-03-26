import 'package:poke_dex/app/domain/entities/pokemon_details_entity.dart';

abstract class PokemonEvent {}

class LoadPokemonEvent extends PokemonEvent {}

class ShowPokemonDetails extends PokemonEvent {
  PokemonDetailsEntity pokemonDetailsEntity;
  ShowPokemonDetails({
    required this.pokemonDetailsEntity,
  });
}
