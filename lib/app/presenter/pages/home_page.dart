import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_dex/app/presenter/blocs/states/pokemon_state.dart';
import 'package:poke_dex/app/utils/app_colors.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pokemonBloc.add(LoadPokemonEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primary,
        title: const Text('Pokedex'),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        bloc: _pokemonBloc,
        builder: (context, state) {
          if (state is PokemonSuccessState) {
            return GridView.builder(
              itemCount: state.pokemonDetails.length,
              itemBuilder: (context, index) {
                final formattedIndex = (index + 1).toString().padLeft(3, '0');
                return GestureDetector(
                  onTap: () => Modular.to.pushNamed(
                    '/details',
                    arguments: {
                      'pokemonDetail': state.pokemonDetails[index],
                      'index': formattedIndex,
                    },
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 2,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Positioned(
                          right: 10,
                          top: 5,
                          child: Text('#$formattedIndex'),
                        ),
                        Positioned(
                          top: 80,
                          right: 0,
                          left: 0,
                          bottom: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Colors.grey.shade200,
                            ),
                            height: 80,
                          ),
                        ),
                        Positioned(
                          bottom: 4,
                          child: Text(state.pokemonDetails[index].name),
                        ),
                        Image.network(state.pokemonDetails[index].urlImage),
                      ],
                    ),
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
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
