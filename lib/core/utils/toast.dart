import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';

enum ToastType { error, success, info }

class Toast {
  static const _defaultDuration = Duration(milliseconds: 500);

  static final Map<ToastType, Color> _toastTxtColors = {
    ToastType.error: const Color(0xFFF14336),
    ToastType.success: const Color(0xFF0097FF),
    ToastType.info: const Color(0xFFFF5F00),
  };

  static final Map<ToastType, Color> _toastBgColors = {
    ToastType.error: const Color(0xFFFFEAE8),
    ToastType.success: const Color(0xFFE2F3FF),
    ToastType.info: const Color(0xFFFFF0E7),
  };

  static final Map<ToastType, Icon> _toastIcons = {
    ToastType.error: const Icon(
      Icons.error_outline,
      color: Color(0xFFF14336),
      size: 16,
    ),
    ToastType.success: const Icon(
      Icons.check_circle,
      color: Color(0xFF0097FF),
      size: 16,
    ),
    ToastType.info: const Icon(
      Icons.info_outline,
      color: Color(0xFFFF5F00),
      size: 16,
    ),
  };

  static void show({
    required BuildContext context,
    required String message,
    ToastType type = ToastType.info,
    Duration duration = _defaultDuration,
  }) {
    toastification.showCustom(
      context: context,
      autoCloseDuration: duration,
      alignment: Alignment.topCenter,
      animationBuilder:
          (context, animation, alignment, child) =>
              FadeTransition(opacity: animation, child: child),
      builder:
          (context, holder) => GestureDetector(
            onTap: () => toastification.dismiss(holder),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: _toastBgColors[type],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 16),
              margin: const EdgeInsets.all(8),
              child: Row(
                children: [
                  _toastIcons[type] ?? const SizedBox.shrink(),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      message,
                      style: GoogleFonts.splineSansMono(
                        color: _toastTxtColors[type],
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: -0.41,
                      ),
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
