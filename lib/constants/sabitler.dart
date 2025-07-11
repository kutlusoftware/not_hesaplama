import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const anaRenk = Colors.indigo;
  static const String baslikText = "Ortalama Hesapla";
  static const baslikRengi = anaRenk;
  static final TextStyle baslikStyle = GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.w900,
  );

  static BorderRadius borderRadius = BorderRadius.circular(24);

  static final TextStyle dersSayisiStyle = GoogleFonts.quicksand(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: anaRenk,
  );

  static final TextStyle ortlamaStyle = GoogleFonts.quicksand(
    fontSize: 55,
    fontWeight: FontWeight.w800,
    color: anaRenk,
  );

  static final TextStyle ortlamaGosterBodyStyle = GoogleFonts.quicksand(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: anaRenk,
  );

  static final EdgeInsets dropDownPadding = EdgeInsets.symmetric(
    //horizontal: 16,
    vertical: 4,
  );
}
