



import 'package:persian_number_utility/persian_number_utility.dart';

///convert string to double
double stringToDouble(String text) {
  String englishText = text.toEnglishDigit();

  return double.parse(englishText.replaceAll(RegExp(r'[^0-9.-]'), ''))
      .toDouble();
}


