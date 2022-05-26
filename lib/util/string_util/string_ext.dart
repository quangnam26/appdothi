extension AppStr on String {
  String get capitalizedWords => substring(0, 1).toUpperCase() + substring(1);
}
