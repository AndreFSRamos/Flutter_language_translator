// ignore_for_file: prefer_typing_uninitialized_variables

// Widget criado para construir um objeto CARD para cada um dos item com seus atributos
// recuperados pela requisição da API. Recebe por parâmetro um objetos do tipo
// Languague.

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/language.dart';
import 'package:flutter_application_1/Widget/format_text.dart';

class TilesLanguage extends StatelessWidget {
  const TilesLanguage({Key? key, required this.languages}) : super(key: key);

  final Languages languages;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormatText(
                title: "created_at:", desc: languages.created_at.toString()),
            FormatText(
                title: "updated_at", desc: languages.updated_at.toString()),
            FormatText(
                title: "resource_id:", desc: languages.resource_id.toString()),
            FormatText(
                title: "module_id:", desc: languages.module_id.toString()),
            FormatText(title: "value:", desc: languages.value.toString()),
            FormatText(
                title: "language_id:", desc: languages.language_id.toString()),
          ],
        ),
      ),
    );
  }
}
