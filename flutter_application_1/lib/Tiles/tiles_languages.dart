import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/language.dart';

class TilesLanguage extends StatelessWidget {
  const TilesLanguage({Key? key, required this.languages}) : super(key: key);

  final Languages languages;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            //Text(items[index]['resource']['created_at']),
            const SizedBox(
              height: 8,
            ),
            //Text(items[index]['resource']['value']),
            const SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
    ;
  }
}
