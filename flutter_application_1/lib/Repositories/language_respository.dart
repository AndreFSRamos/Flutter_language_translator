import 'package:flutter_application_1/Model/language.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

//Chava para localizar o arquivo Shared Preference.
const todoListkey = 'todo_list';

class TodoRespository {
  late SharedPreferences sharedPreferences;

  //Função para recuperar todas as tarefaz salvos em memória interna, ela é
  //pela função INIT STATE da class "TodoList" para carregar as tarefaz do usuário
  //assim que ele entrar no APP.
  //Recupera Instancia.
  //Recupera as informação e armazena em string.
  //Converte para uma Lista e em seguida retorna um MAP.
  Future<List<Languages>> getTodoList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString(todoListkey) ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;
    return jsonDecoded.map((e) => Languages.fromJson(e)).toList();
  }

  //Sava uma nova tarefa no arquivo json gerado pelo Shared Preference.
  void saveTodoList(List<Languages> todos) {
    final String jasonString = json.encode(todos);
    try {
      sharedPreferences.setString('todo_list', jasonString);
    } catch (e) {
      e.toString();
    }
  }
}
