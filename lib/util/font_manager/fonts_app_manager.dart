import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

class FontsAppManager {
  TextStyle textStyle(String fontFamily, FontWeight fontWeight,
      FontStyle fontStyle, double fontSize,
      {Color? color, List<Shadow>? shadows}) {
    return TextStyle(
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        fontSize: fontSize,
        color: color,
        shadows: shadows);
  }

  GoogleFonts googleFonts() {
    return GoogleFonts();
  }
}
