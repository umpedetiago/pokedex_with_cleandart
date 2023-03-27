import 'package:flutter/material.dart';
import 'package:poke_dex/app/domain/entities/pokemon_details_entity.dart';

class DetailsPage extends StatelessWidget {
  final PokemonDetailsEntity pokemonDetail;

  const DetailsPage({Key? key, required this.pokemonDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          pokemonDetail.name,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              pokemonDetail.urlImage,
              scale: 0.3,
            ),
            const Text('Type: '),
            Wrap(
              spacing: 8,
              children: pokemonDetail.type
                  .map((type) => Chip(label: Text(type.name)))
                  .toList(),
            ),
            const Text('Abilities: '),
            Wrap(
              spacing: 8,
              children: pokemonDetail.abilities
                  .map((ability) => Chip(label: Text(ability.name)))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
