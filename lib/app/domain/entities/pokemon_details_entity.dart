import 'package:equatable/equatable.dart';

class PokemonDetailsEntity extends Equatable {
  final String name;
  final String type;
  final String skill;
  final String urlImage;
  const PokemonDetailsEntity({
    required this.name,
    required this.type,
    required this.skill,
    required this.urlImage,
  });

  @override
  List<Object?> get props => [name, type, skill, urlImage];
}
