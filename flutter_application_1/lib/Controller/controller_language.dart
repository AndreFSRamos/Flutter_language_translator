//Class reponsavel pelos preocsso logicos da aplicação.

import 'package:flutter_application_1/Model/language.dart';

//Criação das List de objetos Language.
List<Languages> _languages = [];
List<Languages> _cachelanguages = [];

class ControllerLanguage {
  //Função que recebe os dados recuperado da initState da homePage, em seguida são
  // armazenadas nas lista para serem usados em outra função.
  void setList(List<Languages> language) {
    _languages = language;
    _cachelanguages = language;
    //print("teste 7");
  }

  //Função para as outras parte da aplicação terem acesso é usado na aplicação para
  // as partes terem acesso, sem acessa diretamente as listas. Ela rertona a lista items
  // a serem exibidas ou tratadas.
  List<Languages> getList() {
    return _languages;
  }

  // função de pesqui do tipo "contém", ela emgloba apenas a pesquisa do atributo
  // created_at do objeto Language.
  search(String value) {
    List<Languages> result = _cachelanguages
        .where((language) => language.created_at
            .toString()
            .toLowerCase()
            .contains(value.toLowerCase()))
        .toList();
    _languages = result;
  }

  //Função de filtro pelo atributo Language_id, com o auxilio do laço for é comparado
  // a escolha da opção do filtro com o atributo language_id de cadas item da lista,
  // caso sejam iguais, sera adicionada a list e no final passado essa list para a
  // _language. O mesmo principio se aplica a Função de filtro por module_id.
  filterLanguage(String text) {
    List<Languages> list = [];
    for (int i = 0; i < _cachelanguages.length; i++) {
      if (_cachelanguages[i].language_id.toString().toLowerCase() ==
          text.toLowerCase()) {
        list.add(_cachelanguages[i]);
      }
    }
    _languages = list;
  }

  filterModule(String text) {
    List<Languages> list = [];
    for (int i = 0; i < _cachelanguages.length; i++) {
      if (_cachelanguages[i].module_id.toString().toLowerCase() ==
          text.toLowerCase()) {
        list.add(_cachelanguages[i]);
      }
    }
    _languages = list;
  }

  /*
  
   Foi usado para extrarir e filtrar as opções repetidas de dos atruibutos de modelu_ID 
  e language_id, com a finalidade de otimizar o sistema.
  
  tratar() {
    List result = [];
    String aux = "";
    int count = 0;
    int count2 = 0;
    print("inicio");

    for (int i = 0; i < _languages.length; i++) {
      aux = _languages[i]['resource']['language_id'];
      for (int j = 0; j < _cachelanguages.length; j++) {
        if (aux == _cachelanguages[j]['resource']['language_id']) {
          _cachelanguages.removeAt(j);
          count++;
        }
      }
      count2++;

      if (count > 1) {
        result.add(aux);
      }
    }
    print("FIMM:  ${result.toString()}");

    print("FIMM:  ${result.length}");
    for (int i = 0; i < result.length; i++) {
      print(result[i]);
    }
  }*/
}
