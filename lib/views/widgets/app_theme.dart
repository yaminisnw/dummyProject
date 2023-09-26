import 'package:flutter/material.dart';

import '../../ui.dart';

const Color _defaultColor = Color(0xFFECEEF0);
const Color _hoverColor = Color(0xFFF3F4F6);
const Color _activeColor = Color(0xFFDDE0E3);
const Color _primaryDefaultColor = Color(0xFF0a78cc);
const Color _primaryHoverColor = Color(0xFF51aef5);
const Color _primaryActiveColor = Color(0xFF0a78cc);
const Color _secondaryDefaultColor = Color(0xFF8ccdff);
const Color _secondaryHoverColor = Color(0xFFF7E6FE);
const Color _secondaryActiveColor = Color(0xFFbee0fa);
const Color _secondaryButtonTextColor = Color(0xFF8ccdff);
const Color _invalid = Color(0xFFF38738);
const Color _valid = Color(0xFF4CD272);
const Color _info = Color(0xFF5780BE);
const Color _success = Color(0xFF6DA66C);
const Color _warning = Color(0xFFE49E34);
const Color _error = Color(0xFFDD6868);
const Color _infoBg = Color(0xFFEFF7FE);
const Color _successBg = Color(0xFFEDFBEA);
const Color _warningBg = Color(0xFFFBF7EA);
const Color _errorBg = Color(0xFFFBEDED);
const Color _grey = Color(0xFFA1AFBE);
const Color _textPrimaryColor = Color(0xFF2E2D2D);
const Color _textSecondaryColor = Color(0xFFFFFFFF);
const Color _linkButtonColor = Color(0xFF1D74F5);
const Color _linkVisitedButtonColor = Color(0xFFB36EF7);
const Color _scaffoldPrimaryColor = Color(0xFFFFFFFF);
const Color _isBlockedColor = Color(0xFFF0F2F3);

ThemeData getLightTheme() {
  final AppLightTheme appLightTheme = AppLightTheme();
  final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: _scaffoldPrimaryColor,
    appBarTheme: const AppBarTheme(color: _primaryDefaultColor),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: _primaryDefaultColor),
    brightness: Brightness.light,
    textTheme: TextTheme(
      headline1: appLightTheme.headline1,
      headline2: appLightTheme.headline2,
      headline3: appLightTheme.headline3,
      headline4: appLightTheme.headline4,
      headline5: appLightTheme.headline5,
      headline6: appLightTheme.headline6,
      labelMedium: appLightTheme.label,
      button: appLightTheme.body,
      bodyText1: appLightTheme.body,
    ),
  );
  return theme.copyWith(
    extensions: <ThemeExtension<dynamic>>[appLightTheme],
    splashFactory: NoSplash.splashFactory,
  );
}

class AppLightTheme extends AppTheme {}

abstract class AppTheme extends ThemeExtension<AppTheme> {
  @override
  ThemeExtension<AppTheme> copyWith() {
    return this;
  }

  @override
  ThemeExtension<AppTheme> lerp(ThemeExtension<AppTheme>? other, double t) {
    return this;
  }

  // Font Family
  String? get headlineFontFamily => null;

  String? get bodyFontFamily => null;

  // app text styles
  TextStyle get headline1 => const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: _textPrimaryColor,
      );

  TextStyle get headline2 => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: _textPrimaryColor,
      );

  TextStyle get headline3 => const TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w600,
        color: _textPrimaryColor,
      );

  TextStyle get headline4 => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: _textPrimaryColor,
      );

  TextStyle get headline5 => const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: _textPrimaryColor,
      );

  // app text styles
  TextStyle get headline6 => const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: _textPrimaryColor,
      );

  TextStyle get body => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: bodyFontFamily,
      );

  TextStyle get label => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.6,
        fontFamily: bodyFontFamily,
      );

  // core app colors
  Color get scaffoldPrimaryColor => _scaffoldPrimaryColor;

  Color get appDefaultHoverColor => _hoverColor;

  Color get appDefaultActiveColor => _activeColor;

  Color get appDefaultColor => _defaultColor;

  Color get appPrimaryHoverColor => _primaryHoverColor;

  Color get appPrimaryActiveColor => _primaryActiveColor;

  Color get appPrimaryColor => _primaryDefaultColor;

  Color get appSecondaryHoverColor => _secondaryHoverColor;

  Color get appSecondaryActiveColor => _secondaryActiveColor;

  Color get appSecondaryColor => _secondaryDefaultColor;

  Color get invalid => _invalid;

  Color get valid => _valid;

  // button color
  Color get defaultButtonTextColor => const Color(0xFF2E2D2D);

  Color get primaryButtonTextColor => Colors.white;

  Color get secondaryButtonTextColor => _secondaryButtonTextColor;

  Color get grey => _grey;

  Color get textSecondaryColor => _textSecondaryColor;

  Color get textPrimaryColor => _textPrimaryColor;

  // message color
  Color get info => _info;

  Color get success => _success;

  Color get warning => _warning;

  Color get error => _error;

  // message color
  Color get infoBg => _infoBg;

  Color get successBg => _successBg;

  Color get warningBg => _warningBg;

  Color get errorBg => _errorBg;

  //link buttons

  Color get linkButtonColor => _linkButtonColor;

  Color get linkVisitedButtonColor => _linkVisitedButtonColor;

  // popup colors
  Color get popupDefaultColor => Colors.black;

  Color get popupDefaultIconColor => grey;

  Color get popupHighlightColor => appPrimaryColor;

  //set list item
  Color get isBlockedColor => _isBlockedColor;
}
