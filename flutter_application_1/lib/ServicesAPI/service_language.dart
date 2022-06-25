import 'dart:convert';
import 'package:http/http.dart' as http;

//Classe responsavel por efetuar requisições a API, e repassar a os dados para
//a aplicação.
//convertendo o endereço para Uri.
var request =
    Uri.parse('http://portal.greenmilesoftware.com/get_resources_since');

class GetValue {
  Future<List> getlanguages() async {
    //Solicitando e armazenando a requisição da API.
    http.Response response = await http.get(request);
    //convertendo a resposta  da API para json e retornando o corpo da resposta.
    var dates = json.decode(response.body);
    return dates;
  }
}
