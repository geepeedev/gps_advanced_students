import 'package:flutter/material.dart';
import 'package:gps_advanced_students/core/common/components/text.dart';
import 'package:gps_advanced_students/core/constants/colors.dart';

class GpTextButton extends StatefulWidget {
  const GpTextButton({super.key, this.onPressed, required this.buttonText});

  final void Function()? onPressed;
  final String buttonText;

  @override
  State<GpTextButton> createState() => _GpTextButtonState();
}

class _GpTextButtonState extends State<GpTextButton> {
  Color backgroundColor = GpColors.background;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          backgroundColor = GpColors.onsecondary.withOpacity(0.2);
        });
      },
      onExit: (event) {
        setState(() {
          backgroundColor = GpColors.background;
        });
      },
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        onPressed: widget.onPressed,
        child: GpText.body(
          text: widget.buttonText,
          fontsize: 16,
          fontWeight: FontWeight.w400,
          textColor: GpColors.secondary,
        ),
      ),
    );
  }
}
