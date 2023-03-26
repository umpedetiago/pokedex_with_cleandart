import 'package:equatable/equatable.dart';

class PokemonEntity extends Equatable {
  final String name;
  final String urlDetails;
  const PokemonEntity({
    required this.name,
    required this.urlDetails,
  });

  @override
  List<Object?> get props => [name, urlDetails];
}
