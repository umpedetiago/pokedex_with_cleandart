import 'package:equatable/equatable.dart';

class PokemonAbilityEntity extends Equatable {
  const PokemonAbilityEntity({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  @override
  List<Object?> get props => [name, url];
}
