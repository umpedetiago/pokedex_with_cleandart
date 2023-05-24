import 'package:equatable/equatable.dart';

class PokemonStatsEntity extends Equatable {
  final String name;
  final int value;
  const PokemonStatsEntity({
    required this.name,
    required this.value,
  });

  @override
  List<Object?> get props => [name, value];
}
