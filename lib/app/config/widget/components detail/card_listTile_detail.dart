import 'package:flutter/material.dart';

class CardListTileDetail extends StatelessWidget {
  const CardListTileDetail(
      {Key? key,
      required this.arrow,
      required this.onTap,
      required this.child,
      required this.name})
      : super(key: key);

  final bool arrow;
  final Function() onTap;
  final Widget child;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Card(
              child: ListTile(
                title: Text(name, style: TextStyle(fontSize: 20)),
                trailing: Icon(
                  arrow ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                ),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
