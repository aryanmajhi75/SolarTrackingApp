
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static TextTheme textTheme = TextTheme(
    // Headings with Poppins
    displayLarge: GoogleFonts.poppins(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.5,
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.5,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),

    // Subheadings and body with Lora
    bodyLarge: GoogleFonts.lora(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: GoogleFonts.lora(
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: GoogleFonts.lora(
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),

    // Labels with Lora
    labelLarge: GoogleFonts.lora(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: GoogleFonts.lora(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: GoogleFonts.lora(
      fontSize: 10,
      fontWeight: FontWeight.w500,
    ),
  );
}