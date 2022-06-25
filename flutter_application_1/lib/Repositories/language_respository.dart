import 'package:flutter_application_1/Model/language.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

//Chava para localizar o arquivo Shared Preference.
const todoListkey = 'todo_list';

class LanguageRespository {
  late SharedPreferences sharedPreferences;

  //Função para recuperar todas as tarefaz salvos em memória interna, ela é
  // acionada pela função INIT STATE da class HomoPage para carregar os itens da
  //lista pra o usuário assim que ele entrar no APP.
  //Recupera Instancia de onde está JSON e em seguida armazena a infomação em String.
  //Com a informação em formato String, e convetedito para uma LIST e depois para uma
  // List do tipo Language, armazenado na varias _language .

  Future<List<Languages>> getList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString(todoListkey) ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;
    //print("teste 9 ${jsonString}");
    return jsonDecoded.map((e) => Languages.fromJson(e)).toList();
  }

  // Função ulitazada para converter em arquivo JSON toda a lista de objetos do tipo LANGUAGE que
  // foram recuperado pela requisição da API e armazenar na memória interna do aparelho, para otimizar
  // as pesquisa e ter disponibilidade de informações mesmo sem internet.
  void saveList(List<Languages> todos) {
    final String jasonString = json.encode(todos);
    try {
      //print("teste 10 ${jasonString}");
      sharedPreferences.setString('todo_list', jasonString);
      //print("teste 8 ${jasonString}");
    } catch (e) {
      e.toString();
    }
  }
}
