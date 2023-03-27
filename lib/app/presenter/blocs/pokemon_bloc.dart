import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_dex/app/domain/usecases/pokemon_details_usecase.dart';
import 'package:poke_dex/app/domain/usecases/pokemon_usecase.dart';
import 'package:poke_dex/app/presenter/blocs/events/pokemon_event.dart';
import 'package:poke_dex/app/presenter/blocs/states/pokemon_state.dart';

import '../../domain/entities/pokemon_details_entity.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc(this.pokemonUsecaseImpl, this.pokemonDetailsUsecaseImpl)
      : super(PokemonInitialState()) {
    on<LoadPokemonEvent>(_mapLoadPokemonToState);
  }
  final PokemonUsecaseImpl pokemonUsecaseImpl;
  final PokemonDetailsUsecaseImpl pokemonDetailsUsecaseImpl;

  Future<void> _mapLoadPokemonToState(
    LoadPokemonEvent event,
    Emitter emit,
  ) async {
    final pokemonDetailsList = <PokemonDetailsEntity>[];
    try {
      final result = await pokemonUsecaseImpl();
      final pokemonList = result.getOrThrow();
      for (final pokemon in pokemonList) {
        final result = await pokemonDetailsUsecaseImpl(pokemonEntity: pokemon);
        final pokemonDetails = result.getOrThrow();
        pokemonDetailsList.add(pokemonDetails);
        emit(PokemonSuccessState(pokemonDetails: pokemonDetailsList));
      }
    } catch (_) {
      PokemonErrorState(pokemonDetails: []);
    }
  }
}
