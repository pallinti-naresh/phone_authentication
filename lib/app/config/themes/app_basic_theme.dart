import 'package:flutter/material.dart';

abstract class AppBasicTheme {
  static ThemeData getThemeData() {
    return ThemeData(
      primarySwatch: Colors.blue,
    );
  }
}
