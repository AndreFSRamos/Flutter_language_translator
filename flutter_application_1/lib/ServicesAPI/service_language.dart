import 'dart:convert';
import 'package:http/http.dart' as http;

var request =
    Uri.parse('http://portal.greenmilesoftware.com/get_resources_since');

class GetValue {
  Future<List> getlanguages() async {
    //print("teste2");
    //Solicitando e armazenando a requisição da API.
    http.Response response = await http.get(request);
    print(response.body);
    //convertendo a resposta  da API para json e retornando o corpo da resposta.
    //print(response.body);
    var dates = json.decode(response.body);
    return dates;
  }
}
