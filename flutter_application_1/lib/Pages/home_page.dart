//Essa é a pagina principal que gerencia as demais, e controla seu estado com o
// uso do setState.

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/controller_language.dart';
import 'package:flutter_application_1/Model/items_filter.dart';
import 'package:flutter_application_1/Model/language.dart';
import 'package:flutter_application_1/Model/menu_item.dart';
import 'package:flutter_application_1/Pages/loading_page.dart';
import 'package:flutter_application_1/Repositories/language_respository.dart';
import 'package:flutter_application_1/ServicesAPI/service_language.dart';
import 'package:flutter_application_1/Widget/build_list.dart';
import 'package:flutter_application_1/Widget/search_language.dart';
import 'filter_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

// Declaração de variaveis e controllers.
final controllerLanguage = ControllerLanguage();
final controllerSearch = TextEditingController();
final languageRespository = LanguageRespository();
final itemsFilter = ItemsFilter();
final getValue = GetValue();

// Esse é responsavel por armazenar se as informações estão em processo de
//carregamento ou não. Ela também ira auxiliar na troca da tela de espera.
bool isLoading = false;

class _HomePageState extends State<HomePage> {
// No inititState  primeiramente é tentato carregar os dados armazenados internamente.
// Em seguida a validado de essa carga foi feita, caso sim, sera exibida toda a lista,
// caso contrario ira fazer uma requisição da API, após finalizar ira savar no armazenamento
// interno e salvar variavel _language que está na controller. Essa verificação
// sempre será feita para que haja uma otimização do sistema, efetuando o menor numero
// possivel de requisições, pois é um processo lento.

  @override
  void initState() {
    super.initState();
    print("teste ${controllerLanguage.getList().length}");
    languageRespository.getList().then((value) {
      setState(() {
        controllerLanguage.setList(value);
        isLoading = true;
        print("teste 5 ${controllerLanguage.getList().length}");
      });
      print("teste 1 ${controllerLanguage.getList().length}");
      if (controllerLanguage.getList().isEmpty) {
        isLoading = false;
        getValue.getlanguages().then((value) {
          setState(() {
            Iterable<Languages> result =
                value.map((e) => Languages.fromJson(e)).toList();
            controllerLanguage.setList(result.toList());
            languageRespository.saveList(controllerLanguage.getList());
            print("teste 4 ${controllerLanguage.getList().length}");

            isLoading = true;
          });
        });
      }
    });
    print("teste 3 ${controllerLanguage.getList().length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        elevation: 0,
        // AS menssagem do title da Appbar são alterados de acordo com o conteudo
        // da controller do campo de pesquisa.
        title: controllerSearch.text.isEmpty
            ? Text(
                "Você possui ${controllerLanguage.getList().length} registros",
                style: const TextStyle(fontSize: 16),
              )
            : Text(
                "${controllerLanguage.getList().length} resultados encontrados",
                style: const TextStyle(fontSize: 16)),
        actions: [
          //Responsavel por exibir o botão de menu no canto supeiror direito e
          // auxiliar na navegabilidade  entre a pagina de filtro.
          PopupMenuButton<MenuItem>(
              // Capta a escolha do usuário e direciona pra respectva pagina.
              onSelected: (item) => onSelected(context, item),
              itemBuilder: ((context) =>
                  MenuItems.itemsFist.map(buildItem).toList()))
        ],
      ),
      // Corpo da Home Page, contem a barra de pesquisa e a Lista de itens. São
      // exibidas de acordo com a varial _isLoading. Se estiver em processo de
      // carregamento (FALSE) ira exibir apenas a page de espera, caso contrario
      // ira exibir a lista e a barra de pesquisa.
      body: Column(
        children: [
          isLoading
              ? Search(
                  search: search,
                  hinttext: "Pesquise aqui",
                  controller: controllerSearch,
                )
              : Container(),
          const SizedBox(height: 6),
          !isLoading
              ? const LoadingPage()
              : Expanded(child: BuildListView(controller: controllerLanguage)),
        ],
      ),
    );
  }

  // criar a estrutura das opção do menu, um unica linha(Row), contendo o tilte
  // e um icon.
  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem<MenuItem>(
        value: item,
        child: Row(
          children: [
            const Icon(
              Icons.filter_alt_outlined,
              color: Colors.black,
              size: 20,
            ),
            const SizedBox(width: 12),
            Text(item.text),
          ],
        ),
      );

  //Função Select das opção de escolhas contidas na opçao de menu. São gerenciados
  // por um switch. Com base na escolha é direciodo para uma pagina de filtro,
  // onde são passados como parâmetro a função de filtro, a função de search, o
  // titulo que será exibido na appBare a lisa com os itens a serem exibidos no filtro.
  onSelected(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.itemModeleId:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FilterPage(
                filter: filterModule,
                filterNull: search,
                title: "Filtar por Module_Id",
                items: itemsFilter.filterModuleId)));
        break;
      case MenuItems.itemLangugeId:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FilterPage(
                filter: filterLanguage,
                filterNull: search,
                title: "Filtar por Language_Id",
                items: itemsFilter.filterLanguageId)));
        break;
    }
  }

  // Função de Search para a barra de pesquisa, recebe por parametro uma String.
  // e chamar a função de search da controller, ao obter a resposta é feito o render
  // da tela com o auxilio do setState.

  //O principio a cima de aplica para as função FilterLanguage e Filtermodule.
  void search(String text) {
    setState(() {
      controllerLanguage.search(text);
    });
  }

  void filterLanguage(String text) {
    setState(() {
      controllerLanguage.filterLanguage(text);
    });
  }

  void filterModule(String text) {
    setState(() {
      controllerLanguage.filterModule(text);
    });
  }
}
