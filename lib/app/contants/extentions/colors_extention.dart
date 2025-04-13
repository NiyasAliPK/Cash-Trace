import 'package:flutter/material.dart';

extension ColorSchemeExtension on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;

  Color get primaryColor => colors.primary;
  Color get onPrimaryColor => colors.onPrimary;

  Color get secondaryColor => colors.secondary;
  Color get onSecondaryColor => colors.onSecondary;

  Color get backgroundColor => colors.background;
  Color get onBackgroundColor => colors.onBackground;

  Color get surfaceColor => colors.surface;
  Color get onSurfaceColor => colors.onSurface;

  Color get errorColor => colors.error;
  Color get onErrorColor => colors.onError;

  Color get tertiaryColor => colors.tertiary;
  Color get outlineColor => colors.outline;
}
