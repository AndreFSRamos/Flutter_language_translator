import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/controller_language.dart';
import 'package:flutter_application_1/Pages/filter_page.dart';
import 'package:flutter_application_1/Pages/loading_page.dart';
import 'package:flutter_application_1/ServicesAPI/service_language.dart';
import 'package:flutter_application_1/Widget/build_list.dart';

import 'package:flutter_application_1/Widget/search_language.dart';

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
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Filterpage()));
              },
              icon: const Icon(Icons.filter_list_alt))
        ],
      ),
      body: Column(
        children: [
          Search(
            search: search,
            hinttext: "Pesquise aqui",
            controller: controllerSearch,
          ),
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

  void search(String value) {
    setState(() {
      controllerLanguage.search(value);
    });
  }

  void filter(String text, String value) {
    setState(() {
      controllerLanguage.filter(text, value);
    });
  }
}
