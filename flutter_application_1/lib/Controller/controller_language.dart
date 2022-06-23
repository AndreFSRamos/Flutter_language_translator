import 'package:flutter_application_1/Model/language.dart';

List<dynamic> _languages = [];
List<dynamic> _cachelanguages = [];

class ControllerLanguage {
  void setList(List<dynamic> language) {
    _languages = language;
    _cachelanguages = language;
  }

  List<dynamic> getList() {
    return _languages;
  }

  onChanged(String value) {
    List<dynamic> list = _cachelanguages
        .where((element) =>
            element.toString().toLowerCase().contains(value.toLowerCase()))
        .toList();

    _languages = list;
  }
}
