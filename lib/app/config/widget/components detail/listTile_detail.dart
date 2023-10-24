import 'package:flutter/material.dart';

class ListTileDetail extends StatelessWidget {
  const ListTileDetail({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {},
        child: ListTile(
          title: Text(name),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      ),
    );
  }
}
