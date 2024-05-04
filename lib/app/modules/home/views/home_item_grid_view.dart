import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_apps/app/modules/pokemon/bindings/pokemon_binding.dart';

import '../../pokemon/controllers/pokemon_controller.dart';
import '../../pokemon/views/pokemon_view.dart';

class HomeItemGridView extends StatelessWidget {
  const HomeItemGridView({Key? key, required this.url, required this.name})
      : super(key: key);

  final String url;
  final String name;
  @override
  Widget build(BuildContext context) {
    String idGambar = '${url.substring(34, url.length - 1).length}';
    return InkWell(
      child: Card(
        child: Column(
          children: [
            idGambar == '2'
                ? Container(
                    height: 130,
                    width: 130,
                    child: Image.network(
                      'https://assets.pokemon.com/assets/cms2/img/pokedex/full/0${url.substring(34, url.length - 1)}.png',
                    ),
                  )
                : Container(
                    height: 130,
                    width: 130,
                    child: Image.network(
                      'https://assets.pokemon.com/assets/cms2/img/pokedex/full/00${url.substring(34, url.length - 1)}.png',
                    ),
                  ),
            SizedBox(
              height: 10,
            ),
            Text(
              name,
            ),
          ],
        ),
      ),
      onTap: () {
        if (url.substring(34, url.length - 1).length == 2) {
          Map<String, dynamic> data = {
            'name': name,
            'idLink': '0${url.substring(34, url.length - 1)}',
            'id': url.substring(34, url.length - 1),
          };
          Get.to(
            () => PokemonView(),
            arguments: data,
            binding: BindingsBuilder(() {
              Get.put(PokemonController());
            }),
          );
        } else {
          Map<String, dynamic> data = {
            'name': name,
            'idLink': '00${url.substring(34, url.length - 1)}',
            'id': url.substring(34, url.length - 1),
          };
          Get.to(
            () => PokemonView(),
            //add binding builder
            arguments: data,
            binding: BindingsBuilder(() {
              Get.put(PokemonController());
            }),
          );
        }
      },
    );
  }
}
