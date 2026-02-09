import 'package:flutter/material.dart';


const Color customColor = Color.fromARGB(255, 103, 51, 171);

const List<Color> colorThemes =[
  Color.fromARGB(255, 125, 4, 147),
 Color.fromARGB(255, 132, 87, 162),
  Color.fromARGB(255, 162, 0, 255),
   Color.fromARGB(255, 164, 148, 255),
    Color.fromARGB(255, 32, 9, 79),
     Color.fromARGB(255, 56, 1, 116),
      Color.fromARGB(255, 43, 9, 54),
 
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 3
  })
  :assert(selectedColor >= 0 && selectedColor < colorThemes.length -1, 
  'Colors must be between 0 and ${colorThemes.length}');

  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorThemes[selectedColor],
    );
  }
}
