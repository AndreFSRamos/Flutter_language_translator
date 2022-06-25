class ApiExeptions implements Exception {
  @override
  String toString() {
    return " Falha ao tentar acessar a API, tente novamente mais tarde.";
  }
}
