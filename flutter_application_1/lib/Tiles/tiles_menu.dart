import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/menu_item.dart';

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
