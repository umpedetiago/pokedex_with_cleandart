// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes

class PokemonDetailsEntity {
  final String name;
  final String type;
  final String skill;
  final String urlImage;
  PokemonDetailsEntity({
    required this.name,
    required this.type,
    required this.skill,
    required this.urlImage,
  });

  @override
  bool operator ==(covariant PokemonDetailsEntity other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.type == type &&
        other.skill == skill &&
        other.urlImage == urlImage;
  }

  @override
  int get hashCode {
    return name.hashCode ^ type.hashCode ^ skill.hashCode ^ urlImage.hashCode;
  }
}
