import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/controller_language.dart';
import 'package:flutter_application_1/Pages/loading_page.dart';
import 'package:flutter_application_1/ServicesAPI/service_language.dart';
import 'package:flutter_application_1/Tiles/tiles_menu.dart';
import 'package:flutter_application_1/Widget/build_list.dart';
import 'package:flutter_application_1/Widget/search_language.dart';
import 'filter_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

ControllerLanguage controllerLanguage = ControllerLanguage();
TextEditingController controllerSearch = TextEditingController();
GetValue getValue = GetValue();
bool isLoading = false;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getValue.getlanguages().then((value) {
      setState(() {
        controllerLanguage.setList(value);
        isLoading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        title: controllerSearch.text.isEmpty
            ? Text(
                "Você possui ${controllerLanguage.getList().length} registros",
                style: const TextStyle(fontSize: 16),
              )
            : Text(
                "${controllerLanguage.getList().length} resultados encontrados",
                style: const TextStyle(fontSize: 16)),
        actions: [
          PopupMenuButton(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: ((context) =>
                  MenuItems.itemsFist.map(buildItem).toList()))
        ],
      ),
      body: Column(
        children: [
          isLoading
              ? Search(
                  search: search,
                  hinttext: "Pesquise aqui",
                  controller: controllerSearch,
                )
              : Container(),
          const SizedBox(
            height: 6,
          ),
          !isLoading
              ? const LoadingPage()
              : Expanded(
                  child: BuildListView(controller: controllerLanguage),
                ),
        ],
      ),
    );
  }

  PopupMenuItem buildItem(item) => PopupMenuItem(
        value: item,
        child: Row(
          children: [
            const Icon(
              Icons.filter_alt_outlined,
              color: Colors.black,
              size: 20,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(item.text),
          ],
        ),
      );

  onSelected(BuildContext context, item) {
    if (MenuItems.itemModeleId.text == "Module ID") {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => FilterPage(
            filter: filter,
            filterNull: search,
            type: 'module_id',
            title: "Filtar por Module_Id",
            items: controllerLanguage.getFilterListModuleId(),
          ),
        ),
      );
    }

    if (MenuItems.itemLangugeId.text == "Language ID") {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => FilterPage(
            filter: filter,
            filterNull: search,
            type: 'language_id',
            title: "Filtar por Language_Id",
            items: controllerLanguage.getLisFilterListLanguageId(),
          ),
        ),
      );
    }

    /*switch (item) {
      case (MenuItems.itemModeleId.text == "Module ID":
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FilterPage(
              filter: filter,
              filterNull: search,
              type: 'module_id',
              title: "Filtar por Module_Id",
              items: controllerLanguage.getFilterListModuleId(),
            ),
          ),
        );
        break;
      case MenuItems.itemLangugeId:
       
        break;
    }*/
  }

  void search(String value) {
    setState(() {
      controllerLanguage.search(value);
    });
  }

  void filter(String value, String text) {
    setState(() {
      controllerLanguage.filter(value, text);
    });
  }
}
