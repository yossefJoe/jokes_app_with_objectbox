class Methods {
//singleton class
  Methods._internal();

  static final instance = Methods._internal();

  factory Methods() => instance;
}
