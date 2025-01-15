import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  final TextStyle appBar = GoogleFonts.dmSans(
    fontSize: 24,
    color: const Color.fromARGB(255, 225, 225, 225),
  );

  final TextStyle bodyText = GoogleFonts.dmSans(
    fontSize: 16,
    color: const Color.fromARGB(255, 22, 22, 22),
  );
}

final TextStyles kTextStyles = TextStyles();
