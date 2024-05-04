import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class CardTumbnail extends StatelessWidget {
  const CardTumbnail(
      {Key? key,
      required this.idLink,
      required this.baseExperience,
      required this.height,
      required this.weight})
      : super(key: key);
  final String idLink;
  final String baseExperience;
  final String height;
  final String weight;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                'https://assets.pokemon.com/assets/cms2/img/pokedex/full/${idLink}.png',
                height: 130,
                width: 130,
                fit: BoxFit.cover,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Flexible(
                            child: Text("Base Experience : $baseExperience"),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Flexible(child: Text("Height : $height")),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Flexible(child: Text("Weight : $weight")),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
