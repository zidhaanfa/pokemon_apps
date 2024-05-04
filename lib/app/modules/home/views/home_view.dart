import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/widgets.dart';
import 'package:pokemon_apps/app/modules/camera/bindings/camera_binding.dart';
import 'package:pokemon_apps/app/modules/camera/controllers/camera_controller.dart';
import 'package:pokemon_apps/app/modules/camera/views/camera_view.dart';
import 'package:pokemon_apps/app/modules/login/controllers/login_controller.dart';
import 'package:pokemon_apps/app/modules/login/views/login_view.dart';
import 'package:pokemon_apps/app/modules/pokemon/views/pokemon_view.dart';

import '../../../config/function/snackbar.dart';
import '../controllers/home_controller.dart';
import 'home_item_grid_view.dart';
import 'home_item_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    LoginController loginController = Get.put(LoginController());
    return Obx(() {
      return PopScope(
        canPop: false,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('List pokemon'),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  Get.to(
                    () => CameraView(),
                    binding: BindingsBuilder(() {
                      Get.put(CameraBinding());
                      Get.put(CameraController());
                      // Get.lazyReplace(() => HomeController());
                    }),
                  );
                },
                icon: const Icon(Icons.camera_alt),
              )
            ],
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
              // onLoad: () async {
              //   controller.processGetPokemon();
              // },
              // header: MaterialHeader(),
              onRefresh: () async {
                controller.processGetPokemon();
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 2.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: GoogleUserCircleAvatar(
                            identity: loginController.currentUser!),
                        title: Text(
                            loginController.currentUser!.displayName ?? ''),
                        subtitle: Text(loginController.currentUser!.email),
                        trailing: IconButton(
                          icon: Icon(Icons.logout_outlined),
                          onPressed: () async {
                            await loginController.googleSignIn.disconnect();
                            loginController.isLogin.value = false;
                            Get.offAll(() => LoginView());
                          },
                        ),
                      ),
                      controller.loadingIs.value
                          ? Container(
                              height: 100,
                              child:
                                  Center(child: Text(controller.error.value)),
                            )
                          : Visibility(
                              visible:
                                  controller.pokemonModels!.results!.length > 0,
                              replacement: Container(
                                height: 100,
                                child: Center(child: Text('No Data')),
                              ),
                              child: Column(
                                children: [
                                  // ListView.builder(
                                  //   shrinkWrap: true,
                                  //   physics: NeverScrollableScrollPhysics(),
                                  //   itemCount:
                                  //       controller.pokemonModels!.results?.length ??
                                  //           0,
                                  //   controller: controller.scrollController,
                                  //   itemBuilder: (context, index) {
                                  //     return HomeItemView(
                                  //       url: controller
                                  //           .pokemonModels!.results![index].url!,
                                  //       name: controller
                                  //           .pokemonModels!.results![index].name!,
                                  //     );
                                  //   },
                                  // ),
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    controller: controller.scrollController,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: MediaQuery.of(context)
                                              .size
                                              .width /
                                          (MediaQuery.of(context).size.height /
                                              1.9),
                                    ),
                                    itemCount: controller
                                            .pokemonModels!.results?.length ??
                                        0,
                                    itemBuilder: (context, index) {
                                      return HomeItemGridView(
                                        url: controller.pokemonModels!
                                            .results![index].url!,
                                        name: controller.pokemonModels!
                                            .results![index].name!,
                                      );
                                    },
                                  )
                                ],
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
                              controller.offset.value =
                                  controller.offset.value -
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
                              controller.offset.value =
                                  controller.offset.value +
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
        ),
      );
    });
  }
}
