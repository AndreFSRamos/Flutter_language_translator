import 'package:flutter/material.dart';

//Construção do objeto MunuItem, o mesmo que é exibido no canto superior direito,
// ultilizado para escolher o tipo de filtro.

class MenuItem {
  final String text;
  final Icon icon;

  const MenuItem({required this.text, required this.icon});
}

class MenuItems {
  static const List<MenuItem> itemsFist = [
    itemModeleId,
    itemLangugeId,
  ];

  static const itemModeleId =
      MenuItem(text: "Module ID", icon: Icon(Icons.filter_alt_rounded));

  static const itemLangugeId =
      MenuItem(text: "Language ID", icon: Icon(Icons.filter_alt_rounded));
}
