import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/controller_language.dart';
import 'package:flutter_application_1/ServicesAPI/service_language.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

ControllerLanguage controllerLanguage = ControllerLanguage();

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    GetValue getValue = GetValue();
    getValue.getlanguages().then((value) {
      setState(() {
        controllerLanguage.setList(value);
      });
    });
    //print("teste");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(),
          centerTitle: true,
        ),
        body: _BuildListView());
    //====================== CRIANDO O EFEITO GRADIENTE =======================
  }

  _BuildListView() {
    List<dynamic> items = controllerLanguage.getList();
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("created_at: ${items[index]['resource']['created_at']}"),
                  const SizedBox(
                    height: 8,
                  ),
                  Text("updated_at: ${items[index]['resource']['updated_at']}"),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                      "resource_id: ${items[index]['resource']['resource_id']}"),
                  const SizedBox(
                    height: 8,
                  ),
                  Text("module_id: ${items[index]['resource']['module_id']}"),
                  const SizedBox(
                    height: 8,
                  ),
                  Text("value: ${items[index]['resource']['value']}"),
                  const SizedBox(
                    height: 8,
                  ),
                  Text("value: ${items[index]['resource']['language_id']}"),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
