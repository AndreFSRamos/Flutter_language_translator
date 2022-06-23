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
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
        Expanded(
          child: Text(
            desc,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
