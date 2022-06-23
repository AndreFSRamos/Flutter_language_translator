// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widget/format_text.dart';

class TilesLanguage extends StatelessWidget {
  const TilesLanguage({Key? key, required this.languages}) : super(key: key);

  final languages;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormatText(title: "created_at:", desc: languages['created_at']),
            FormatText(title: "updated_at", desc: languages['updated_at']),
            FormatText(title: "resource_id:", desc: languages['resource_id']),
            FormatText(title: "module_id:", desc: languages['module_id']),
            FormatText(title: "value:", desc: languages['value']),
            FormatText(title: "language_id:", desc: languages['language_id']),
          ],
        ),
      ),
    );
  }
}
