class PokemonEntity {
  final String name;
  final String urlImage;
  PokemonEntity({
    required this.name,
    required this.urlImage,
  });

  @override
  bool operator ==(covariant PokemonEntity other) {
    if (identical(this, other)) return true;

    return other.name == name && other.urlImage == urlImage;
  }

  @override
  int get hashCode => name.hashCode ^ urlImage.hashCode;
}
