class Enviroment {
  String baseUrlAPI;
  Enviroment({
    required this.baseUrlAPI,
  });
}

class Dev implements Enviroment {
  @override
  String baseUrlAPI = 'AIzaSyC5YFhhEvFvKBA9du8i0gmoxayMzO6U7PM';
}

class CurrentEnviroment {
  static Enviroment enviroment = Dev();
}
