// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes

class PokemonEntity {
  final String name;
  final String urlDetails;
  PokemonEntity({
    required this.name,
    required this.urlDetails,
  });

  @override
  bool operator ==(covariant PokemonEntity other) {
    if (identical(this, other)) return true;

    return other.name == name && other.urlDetails == urlDetails;
  }

  @override
  int get hashCode => name.hashCode ^ urlDetails.hashCode;
}
