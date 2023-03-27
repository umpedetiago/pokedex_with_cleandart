import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_dex/app/presenter/blocs/states/pokemon_state.dart';

import '../blocs/events/pokemon_event.dart';
import '../blocs/pokemon_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PokemonBloc _pokemonBloc;

  @override
  void initState() {
    super.initState();
    _pokemonBloc = Modular.get<PokemonBloc>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _pokemonBloc.add(LoadPokemonEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokedex')),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        bloc: _pokemonBloc,
        builder: (context, state) {
          if (state is PokemonSuccessState) {
            return ListView.builder(
              itemCount: state.pokemonDetails.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Modular.to.pushNamed(
                    '/details',
                    arguments: state.pokemonDetails[index],
                  ),
                  child: Card(
                    child: ListTile(
                      title: Text(state.pokemonDetails[index].name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Type: '),
                          Wrap(
                            spacing: 8,
                            children: state.pokemonDetails[index].type
                                .map((type) => Chip(label: Text(type.name)))
                                .toList(),
                          ),
                        ],
                      ),
                      leading:
                          Image.network(state.pokemonDetails[index].urlImage),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
