import 'package:get/get.dart';

import '../controllers/pokemon_controller.dart';

class PokemonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PokemonController>(
      () => PokemonController(),
    );
  }
}
