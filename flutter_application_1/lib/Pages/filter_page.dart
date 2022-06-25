//Page resposavel por fazer o render das listas de filtro, com o auxilio do SETSTAE
//Ela recebe por parâmetro as funções filter que é reponsavel por fazer o filtro,
//a filterNull, ela é a mesma fução do search, está sendo usada aqui apenas para
//retornar a lista cheia, caso não seja escolhida a opção "Nenhuem", recebe também
// a String title, referente ao nome da opção e a list que contem todas as opção
// de escolha. Parâmetro enviados da HomePage.

import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({
    Key? key,
    required this.filter,
    required this.filterNull,
    required this.title,
    required this.items,
  }) : super(key: key);

  final Function filter;
  final Function filterNull;
  final String title;
  final List items;

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  // Inicia em 0 para sempre inciar na opção "Nenhum",
  int _value = 0;
  // Armazena o resultado da escolha.
  String _result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                //Caso a variavel _value seja igual a 0, significa que a escolha e nenhum,
                // então e retorna a lista cheia. Caso contrario retorna o resultado com
                //base na varial _result.
                if (_value == 0) {
                  widget.filterNull("");
                  Navigator.of(context).pop();
                } else {
                  widget.filter(_result);
                  Navigator.of(context).pop();
                }
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Card(
                color: Colors.grey[900],
                child: Row(
                  children: [
                    Radio(
                        // O posição do Botão do tipo "Radio" e controlada pela
                        //variavel _value que recebe o INDEX(posição do item na lista).
                        // a varial _result recebe o valor do item selecionado.
                        value: index,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = index;
                            _result = widget.items[index].toString();
                          });
                        }),
                    Text(
                      widget.items[index],
                      style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
