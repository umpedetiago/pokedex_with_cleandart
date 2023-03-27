abstract class PokemonEvent {}

class LoadPokemonEvent extends PokemonEvent {}

class SelectPokemonEvent extends PokemonEvent {
  final int selectedIndex;

  SelectPokemonEvent({required this.selectedIndex});
}
