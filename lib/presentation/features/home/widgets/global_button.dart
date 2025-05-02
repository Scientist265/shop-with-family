import 'package:flutter/material.dart';
import 'package:sippylife_assesment/core/extensions/sizing.dart';
import 'package:sippylife_assesment/core/theme/colors.dart';
import 'package:sippylife_assesment/core/theme/text_style.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({
    super.key,
    this.onPressed,
    required this.labelText,
    this.icon,
    this.color = AppColors.teal,
  });

  final void Function()? onPressed;
  final String labelText;
  final IconData? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) Icon(icon, color: AppColors.white),
          5.wt,
          Text(
            labelText,
            style: appStyle(16, FontWeight.w400, AppColors.white),
          ),
        ],
      ),
    );
  }
}
