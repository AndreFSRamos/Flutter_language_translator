// Widget Search(Barra de pesquisa) se encontra logo a baixo da APPBAR, ela é acionada pela HomePage,
// logo após a aplicação receber a requisição da API. Ela receber por parâmetro , uma String "hinttext"
// responsavel por exibir a messagem "Pesquise aqui", uma TextEditingController que coleta a infomar
// a ser pesquisada a função "search" que é executada ao clicar no iconbuttom, e ira retornor a informação
// da pesquisa.

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

  //É construida em uma ROW e envolvida por um CONTAINER para criar o efeito de
  //bordas arrendondadas.
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Row(
        children: [
          Expanded(
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
                      color: Colors.blue,
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
