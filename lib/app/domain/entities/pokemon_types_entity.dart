import 'package:equatable/equatable.dart';

class PokemomTypeEntity extends Equatable {
  const PokemomTypeEntity({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  @override
  List<Object?> get props => [name, url];
}
