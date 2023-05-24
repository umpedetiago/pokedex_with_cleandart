// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:line_icons/line_icons.dart';

import 'package:poke_dex/app/domain/entities/pokemon_details_entity.dart';
import 'package:poke_dex/app/presenter/wigets/stats_bar_widget.dart';
import 'package:poke_dex/app/utils/app_colors.dart';
import 'package:poke_dex/app/utils/app_fonts.dart';

class DetailsPage extends StatelessWidget {
  final PokemonDetailsEntity pokemonDetail;
  final String index;

  const DetailsPage({
    Key? key,
    required this.pokemonDetail,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainColor = AppColors.selectTypeColor(pokemonDetail.type.first.name);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: mainColor,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.65,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                width: MediaQuery.of(context).size.width * 0.97,
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 80,
            child: Text(
              pokemonDetail.name[0].toUpperCase() +
                  pokemonDetail.name.substring(1),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            top: 95,
            right: 30,
            child: Text(
              '#$index',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            top: 100,
            right: 40,
            child: Image.network(
              width: 350,
              height: 350,
              pokemonDetail.urlImage,
              scale: 0.1,
            ),
          ),
          Positioned(
            bottom: 50,
            child: Column(
              children: [
                SafeArea(
                  child: Wrap(
                    spacing: 8,
                    children: pokemonDetail.type
                        .map(
                          (type) => Chip(
                            label: Text(type.name),
                            backgroundColor:
                                AppColors.selectTypeColor(type.name),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'About',
                  style: AppFontes.subtitle1.copyWith(
                    color: AppColors.selectTypeColor(
                      pokemonDetail.type.first.name,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Wrap(
                  spacing: 16,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            const Icon(LineIcons.hangingWeight),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                pokemonDetail.weight
                                    .toString()
                                    .replaceAll('.', ','),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text('Weight'),
                      ],
                    ),
                    Container(
                      width: 1,
                      height: 60,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            const Icon(LineIcons.rulerVertical),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                pokemonDetail.height
                                    .toString()
                                    .replaceAll('.', ','),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text('Heigth'),
                      ],
                    ),
                    Container(
                      width: 1,
                      height: 60,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    Column(
                      children: [
                        Wrap(
                          direction: Axis.vertical,
                          spacing: 1,
                          children: pokemonDetail.abilities
                              .map((ability) => Text(ability.name))
                              .toList(),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text('Moves'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 48,
                ),
                const Text('Base Stats'),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Wrap(
                      spacing: 8,
                      direction: Axis.vertical,
                      children: pokemonDetail.stats
                          .map(
                            (e) => Text(
                              statsName(e.name),
                              style: AppFontes.subtitle1.copyWith(
                                fontSize: 14,
                                color: AppColors.selectTypeColor(
                                  pokemonDetail.type.first.name,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: 1,
                      height: 200,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    Wrap(
                      spacing: 8,
                      direction: Axis.vertical,
                      children: pokemonDetail.stats
                          .map(
                            (e) => StatsBar(
                              currentValue: e.value,
                              color: mainColor,
                            ),
                          )
                          .toList(),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 70,
            left: 8,
            child: IconButton(
              onPressed: () => Modular.to.popUntil(ModalRoute.withName('/')),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 48,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String statsName(String stats) {
    switch (stats) {
      case 'hp':
        return 'HP';
      case 'attack':
        return 'ATK';
      case 'defense':
        return 'DEF';
      case 'special-attack':
        return 'SATK';
      case 'special-defense':
        return 'SDEF';
      case 'speed':
        return 'SPD';
      default:
        return '';
    }
  }
}
