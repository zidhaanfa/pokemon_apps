import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pokemon_controller.dart';

class PokemonView extends GetView<PokemonController> {
  const PokemonView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PokemonView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PokemonView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
