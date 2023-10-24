import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pokemon_apps/app/config/baseData.dart';
import 'package:pokemon_apps/app/config/widget/components%20detail/card_tumbnail.dart';

import '../../../config/widget/components detail/card_listTile_detail.dart';
import '../../../config/widget/components detail/listTile_detail.dart';
import '../controllers/pokemon_controller.dart';

class PokemonView extends GetView<PokemonController> {
  const PokemonView({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    PokemonController controller = Get.put(PokemonController());
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Pokemon Detail'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: EasyRefresh(
            header: MaterialHeader(
              hitOver: isBlank,
              bezierBackgroundAnimation: true,
              safeArea: true,
              semanticsLabel: tag,
              triggerOffset: 50.0,
            ),
            // header: MaterialHeader(),
            onRefresh: () async {
              controller.processGetPokemon();
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: controller.loadingIs.value
                  ? Container(
                      height: 100,
                      child: Center(child: Text(controller.error.value)),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              CardTumbnail(
                                idLink: controller.idLink.value,
                                baseExperience:
                                    '${controller.pokemonDetailModels?.baseExperience ?? ''}',
                                height:
                                    '${controller.pokemonDetailModels?.height ?? ''}',
                                weight:
                                    '${controller.pokemonDetailModels?.weight ?? ''}',
                              ),
                              CardListTileDetail(
                                name: 'Abilities',
                                arrow: controller.showAbilities.value,
                                onTap: () {
                                  controller.changeBoleanshowAbilities();
                                  print(
                                      'showAbilities = ${controller.showAbilities.value}');
                                },
                                child: controller.showAbilities.value
                                    ? Card(
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: controller
                                              .pokemonDetailModels
                                              ?.abilities
                                              ?.length,
                                          itemBuilder: (context, index) {
                                            return ListTileDetail(
                                              name: controller
                                                      .pokemonDetailModels
                                                      ?.abilities?[index]
                                                      .ability
                                                      ?.name ??
                                                  '',
                                            );
                                          },
                                        ),
                                      )
                                    : Container(),
                              ),
                              CardListTileDetail(
                                name: 'Forms',
                                arrow: controller.showAbilities.value,
                                onTap: () {
                                  controller.changeBoleanshowForms();
                                },
                                child: controller.showForms.value
                                    ? Card(
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: controller
                                              .pokemonDetailModels
                                              ?.forms
                                              ?.length,
                                          itemBuilder: (context, index) {
                                            return ListTileDetail(
                                              name: controller
                                                      .pokemonDetailModels
                                                      ?.forms?[index]
                                                      .name ??
                                                  '',
                                            );
                                          },
                                        ),
                                      )
                                    : Container(),
                              ),
                              CardListTileDetail(
                                name: 'Game Indices',
                                arrow: controller.showGameIndices.value,
                                onTap: () {
                                  controller.changeBoleanshowGameIndices();
                                },
                                child: controller.showGameIndices.value
                                    ? Card(
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: controller
                                              .pokemonDetailModels
                                              ?.gameIndices
                                              ?.length,
                                          itemBuilder: (context, index) {
                                            return ListTileDetail(
                                              name: controller
                                                      .pokemonDetailModels
                                                      ?.gameIndices![index]
                                                      .version!
                                                      .name ??
                                                  '',
                                            );
                                          },
                                        ),
                                      )
                                    : Container(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      );
    });
  }
}
