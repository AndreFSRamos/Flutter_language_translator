import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //comando para deixar a barra de noficação transparente.
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //comando para recuperar a TAG de Modo DEBUG
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
