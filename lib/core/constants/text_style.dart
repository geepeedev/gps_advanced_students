import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class KTextStyles {
  final TextStyle headingLarge = GoogleFonts.poppins(
    fontSize: 40,
    fontWeight: FontWeight.w500
  );
   final TextStyle headingMedium = GoogleFonts.poppins(
    fontSize: 30,
    fontWeight: FontWeight.w500
  );
}
