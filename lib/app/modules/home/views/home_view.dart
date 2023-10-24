import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokemon_apps/app/modules/pokemon/views/pokemon_view.dart';

import '../../../config/function/snackbar.dart';
import '../controllers/home_controller.dart';
import 'home_item_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: const Text('List pokemon'),
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
            onLoad: () async {
              controller.processGetPokemon();
            },
            // header: MaterialHeader(),
            onRefresh: () async {
              controller.processGetPokemon();
            },
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                child: Column(
                  children: [
                    controller.loadingIs.value
                        ? Container(
                            height: 100,
                            child: Center(child: Text(controller.error.value)),
                          )
                        : Visibility(
                            visible:
                                controller.pokemonModels!.results!.length > 0,
                            replacement: Container(
                              height: 100,
                              child: Center(child: Text('No Data')),
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  controller.pokemonModels!.results?.length ??
                                      0,
                              controller: controller.scrollController,
                              itemBuilder: (context, index) {
                                return HomeItemView(
                                  url: controller
                                      .pokemonModels!.results![index].url!,
                                  name: controller
                                      .pokemonModels!.results![index].name!,
                                );
                              },
                            ),
                          )
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: controller.loadingIs.value
            ? Container(
                height: 50,
                child: Center(child: Text(controller.error.value)),
              )
            : Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton(
                        onPressed: () {
                          // controller.processGetPokemonPrev();
                          if (controller.prevLink.value == '') {
                            snackbar(
                              "warning",
                              "Halaman pertama",
                              1,
                              null,
                            );
                          } else {
                            controller.offset.value = controller.offset.value -
                                controller.limit.value;
                            controller.processGetPokemon();
                          }
                        },
                        child: const Text('Prev'),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton(
                        onPressed: () {
                          // controller.processGetPokemonNext();
                          if (controller.nextLink.value == '') {
                            snackbar(
                              "warning",
                              "Halaman terakhir",
                              1,
                              null,
                            );
                          } else {
                            controller.offset.value = controller.offset.value +
                                controller.limit.value;
                            controller.processGetPokemon();
                          }
                        },
                        child: const Text('Next'),
                      ),
                    )
                  ],
                ),
              ),
      );
    });
  }
}
