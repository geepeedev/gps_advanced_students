import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gps_advanced_students/core/constants/colors.dart';

class GpText extends StatelessWidget {
  const GpText(
      {super.key,
      required this.text,
      this.style,
      this.textColor,
      this.fontWeight,
      this.textAlign,
      this.fontsize});

  GpText.headline({
    super.key,
    required this.text,
    // this.style,
    this.textColor = GpColors.textDark,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
    this.fontsize = 24,
  }) : style = GoogleFonts.poppins(
          fontSize: fontsize,
          fontWeight: fontWeight,
          color: textColor,
        );
  GpText.body({
    super.key,
    required this.text,
    // this.style,
    this.textColor = GpColors.textDark,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
    this.fontsize = 18,
  }) : style = GoogleFonts.aBeeZee(
          fontSize: fontsize,
          fontWeight: fontWeight,
          color: textColor,
        );

  final String text;
  final TextStyle? style;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final double? fontsize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
