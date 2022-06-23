import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search(
      {Key? key,
      required this.search,
      required this.hinttext,
      required this.controller})
      : super(key: key);

  final String hinttext;
  final Function(String) search;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Row(
        children: [
          Expanded(
            // Campo de texo da barra de pesquisa.
            child: Container(
              height: 42,
              margin: const EdgeInsets.fromLTRB(4, 0, 4, 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(color: Colors.black26),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        search(controller.text);
                      },
                    ),
                    border: InputBorder.none,
                    hintText: hinttext,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
