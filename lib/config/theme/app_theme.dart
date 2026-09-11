import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get theme => ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorSchemeSeed: const Color(0xff2862f5),
    );
}