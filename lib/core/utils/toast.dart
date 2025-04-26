import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';

enum ToastType { error, success, info }

class Toast {
  BuildContext context;
  WidgetRef? ref;

  Toast(this.context, {this.ref});

  Map<ToastType, Color?> toastTxtColors = {
    ToastType.error: const Color(0xFFF14336),
    ToastType.success: const Color(0xFF0097FF),
    ToastType.info: const Color(0xFFFF5F00),
  };

  Map<ToastType, Color?> toastBdColors = {
    ToastType.error: Colors.transparent,
    ToastType.success: Colors.transparent,
    ToastType.info: Colors.transparent,
  };

  Map<ToastType, Color?> toastBgColors = {
    ToastType.error: const Color(0xFFFFEAE8),
    ToastType.success: const Color(0xFFE2F3FF),
    ToastType.info: const Color(0xFFFFF0E7),
  };

  Map<ToastType, Widget?> toastIcons = {
    ToastType.error: Icon(Icons.error_outline,
      color: const Color(0xFFF14336),
      size: 16,
    ),
    
    
  
    ToastType.success: Icon(
      Icons.check_circle,
      color: const Color(0xFF0097FF),
      size: 16,
    
    )
 
  };

  show(
    String? message, [
    ToastType type = ToastType.info,
    bool withScaffold = false,
  ]) {
    toastification.showCustom(
      context: context, 
      autoCloseDuration: const Duration(seconds: 5),
      alignment: Alignment.topCenter,
      animationBuilder:
          (context, animation, alignment, child) =>
              FadeTransition(opacity: animation, child: child),

      builder: (BuildContext context, ToastificationItem holder) {
        return GestureDetector(
          onTap: () {
            toastification.dismiss(holder);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: toastBgColors[type],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 16),
            margin: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    toastIcons[type]!,
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "$message",
                        style: GoogleFonts.splineSansMono(
                          color: toastTxtColors[type],
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
              ],
            ),
          ),
        );
      },
    );
  }
}
