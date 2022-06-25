// Esse Widget foi criado com a finalidade de economizar linhas de código e deixa-lo
// organizado, pois é um widget que se repete. Ela recebe por parâmetro duas String
// que são formatadas e retornadas. Ela é acionada  pela TilesLanguage.

import 'package:flutter/material.dart';

class FormatText extends StatelessWidget {
  const FormatText({Key? key, required this.title, required this.desc})
      : super(key: key);

  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
        ),
        Expanded(
          child: Text(
            desc,
            style: const TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
      ],
    );
  }
}
