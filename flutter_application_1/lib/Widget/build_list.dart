import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/controller_language.dart';

import '../Tiles/tiles_languages.dart';

class BuildListView extends StatelessWidget {
  const BuildListView({Key? key, required this.controller}) : super(key: key);
  final ControllerLanguage controller;
  @override
  Widget build(BuildContext context) {
    List<dynamic> items = controller.getList();
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TilesLanguage(languages: items[index]['resource']),
            ],
          );
        });
  }
}
