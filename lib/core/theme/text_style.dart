import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sippylife_assesment/core/theme/colors.dart';

appStyle([double? size, FontWeight? weight, Color? color]) {
  return GoogleFonts.poppins(
    fontSize: size ?? 16,
    fontWeight: weight ?? FontWeight.w500,
    color: color ?? AppColors.white,
  );
}
