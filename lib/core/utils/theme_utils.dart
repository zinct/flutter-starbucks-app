import 'package:flutter/material.dart';
import 'package:starbacks/core/resources/colors.dart';
import 'package:starbacks/core/resources/fonts.dart';

import 'package:material_color_generator/material_color_generator.dart';

ThemeData themeData = ThemeData(
  primarySwatch: generateMaterialColor(color: BaseColors.primaryColor),
  primaryColor: BaseColors.primaryColor,
  textTheme: const TextTheme(
      // titleSmall: titleSmall,
      // titleMedium: titleMedium,
      // headlineMedium: headlineMedium,
      // displayMedium: displayMedium,
      // displayLarge: displayLarge,
      // labelSmall: labelSmall,
      ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
