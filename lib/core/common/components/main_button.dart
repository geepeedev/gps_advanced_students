import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gps_advanced_students/core/constants/colors.dart';

class GpElevatedButton extends StatefulWidget {
  const GpElevatedButton({
    super.key,
    this.onTap,
    required this.buttonText,
    this.width,
    this.height,
    this.disabled = false,
  });
  final void Function()? onTap;
  final String buttonText;
  final double? width;
  final double? height;
  final bool disabled;
  @override
  State<GpElevatedButton> createState() => _GpElevatedButtonState();
}

class _GpElevatedButtonState extends State<GpElevatedButton> {
  Color backgroundColor = GpColors.background;
  Color borderColor = GpColors.primary;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (event) {
          
          setState(() {
            backgroundColor = GpColors.primary;

            borderColor = Colors.black;
          });
        },
        onExit: (event) {
          setState(() {
            backgroundColor = GpColors.background;

            borderColor = GpColors.primary;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.width,
          height: widget.height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: backgroundColor,
            border: Border.all(color: borderColor, width: 1.2),
          ),
          child: widget.disabled
              ? FractionallySizedBox(
                  heightFactor: 0.7,
                  widthFactor: 0.08,
                  child: CircularProgressIndicator(
                    color: borderColor,
                  ),
                )
              : Text(
                  widget.buttonText,
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
        ),
      ),
    );
  }
}
