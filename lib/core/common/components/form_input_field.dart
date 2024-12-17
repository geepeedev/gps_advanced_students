import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gps_advanced_students/core/common/components/text.dart';
import 'package:gps_advanced_students/core/constants/colors.dart';
import 'package:gap/gap.dart';

class GpFormInputField extends StatelessWidget {
  const GpFormInputField({
    super.key,
    required this.textfieldLabel,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.onChanged,
    this.isObsecureText = false,
    this.errorWidget,
    this.keyboardType,
  });

  final String textfieldLabel;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool isObsecureText;
  final Widget? errorWidget;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GpText.body(
          text: textfieldLabel,
          textColor: GpColors.textlight,
          fontsize: 18,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.start,
        ),
        const Gap(5),
        SizedBox(
          width: 400,
          child: TextFormField(
            
            keyboardType: keyboardType,
            obscureText: isObsecureText,
            onChanged: onChanged,
            controller: controller,
            cursorColor: GpColors.background,
            cursorRadius: const Radius.circular(18),
            decoration: InputDecoration(
              errorStyle: const TextStyle(color: GpColors.error),
              error: errorWidget,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              filled: true,
              hoverColor: Colors.white70,
              hintText: hintText,
              hintStyle: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: GpColors.textDark,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: GpColors.error,
                  width: 3,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: GpColors.error,
                  width: 2,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
