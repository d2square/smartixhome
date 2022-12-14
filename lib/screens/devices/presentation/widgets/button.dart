import 'package:flutter/material.dart';
import 'package:smartix/utils/colors.dart';
import 'package:smartix/utils/common.dart';

enum BtnState { active, inactive }

class AppButtonPrimary extends StatelessWidget {
  const AppButtonPrimary({
    Key? key,
    this.onPressed,
    required this.label,
    this.btnColor,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String label;
  final Color? btnColor;

  @override
  Widget build(BuildContext context) {
    final effectiveBackgroundColor = btnColor ?? SmartIxColors.primary;
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: Utils.textStyle(
              fontSize: 14.0,
              colors: SmartIxColors.tertiary,
              weight: FontWeight.w500),
        ),
        style: TextButton.styleFrom(
          primary: effectiveBackgroundColor,
          backgroundColor: effectiveBackgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
