List<dynamic> _languages = [];
List<dynamic> _cachelanguages = [];
List _filterModuleId = [
  'GreenMileCommons',
  'BI',
  'central',
  'DEPOT',
  'GreenMileDepot',
  'GreenMileDriverJME',
  'BSBoard',
  'GreenMileMyOrder',
  'JME',
  'LiveFeed',
  'GreenMileDriver',
  'GreenMileManager',
  'GreenMileTrack',
  'GreenMileLoader',
  'DIManager',
  'MANAGER ',
  'GreenMileReport'
];

List _filterLanguageId = [
  'en-g',
  'it',
  'th',
  'es',
  'ja',
  'fr',
  'ru',
  'de',
  'en',
  'he',
  'pl',
  'ar',
  'pt',
  'cs',
  'ro'
];

class ControllerLanguage {
  void setList(List<dynamic> language) {
    _languages = language;
    _cachelanguages = language;
  }

  List<dynamic> getList() {
    return _languages;
  }

  List<dynamic> getFilterListModuleId() {
    return _filterModuleId;
  }

  List<dynamic> getLisFilterListLanguageId() {
    return _filterLanguageId;
  }

  search(String value) {
    List<dynamic> list = _cachelanguages
        .where((element) =>
            element.toString().toLowerCase().contains(value.toLowerCase()))
        .toList();
    _languages = list;
  }

  filter(String text, String value) {
    List<dynamic> list = _cachelanguages
        .where((element) => element['resource']['module_id']
            .toString()
            .toLowerCase()
            .contains('GreenMileDriverGeneric'.toLowerCase()))
        .toList();
    _languages = list;
  }

  /*tratar() {
    List result = [];
    String aux = "";
    int count = 0;
    int count2 = 0;
    print("inicio");

    for (int i = 0; i < _languages.length; i++) {
      aux = _languages[i]['resource']['language_id'];
      for (int j = 0; j < _cachelanguages.length; j++) {
        if (aux == _cachelanguages[j]['resource']['language_id']) {
          _cachelanguages.removeAt(j);
          count++;
        }
      }
      count2++;

      if (count > 1) {
        result.add(aux);
      }
    }
    print("FIMM:  ${result.toString()}");

    print("FIMM:  ${result.length}");
    for (int i = 0; i < result.length; i++) {
      print(result[i]);
    }
  }*/
}
