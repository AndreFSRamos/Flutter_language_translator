// Widget responsavel por criar um lista na Homepage com todos os items e seus
// atributos recuperados pela API. Recebe por parâmetro um objetos do tipo
// ControllerLanguage, para que seja recuperado a lista de itens, após isso
// dentro do ListViewBuilder e chamado o Widget Tileslanguage e passado por
// parâmentro cada item da lista.

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/controller_language.dart';
import 'package:flutter_application_1/Model/language.dart';
import '../Tiles/tiles_languages.dart';

// Widget Resonsavel por gerar um lista de rolagem com todos os itens armazenados
// na List items. Para cada posição da lista ela passa por
//parâmetro um objetos do tipo Language para a TitesLanguage.
class BuildListView extends StatelessWidget {
  const BuildListView({Key? key, required this.controller}) : super(key: key);
  final ControllerLanguage controller;
  @override
  Widget build(BuildContext context) {
    List<Languages> items = controller.getList();
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TilesLanguage(languages: items[index]),
            ],
          );
        });
  }
}
