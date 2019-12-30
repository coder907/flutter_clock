import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:tinycolor/tinycolor.dart';

import '../presentation/rebase60_digit.dart';

/// A utility class that manages and provides access to themed properties.
///
/// A new instance of this class should be created on each (GUI) build.
class AppTheme {
  //
  final fontFamily = 'Monaco';
  final displayMode = DisplayMode.uppercase;

  Color _backgroundColor;
  Color get backgroundColor => _backgroundColor;

  Color _textColor;
  Color get textColor => _textColor;

  Color _textShadowColor;
  Color get textShadowColor => _textShadowColor;

  /// Themed properties are defined based on the provided [ThemeData] 
  /// and [ClockModel].
  AppTheme(
    ThemeData theme,
    ClockModel model,
  ) {
    _defineColors(model.weatherCondition);
    _adjustColors(theme.brightness);
  }

  /// Defines colors based on [WeatherCondition].
  void _defineColors(WeatherCondition weatherCondition) {
    switch (weatherCondition) {
      case WeatherCondition.snowy:
        _backgroundColor = Colors.white;
        _textColor = Colors.blue.shade300;
        _textShadowColor = Colors.blue.shade900;
        break;
      case WeatherCondition.sunny:
        _backgroundColor = Colors.blue.shade300;
        _textColor = Colors.white;
        _textShadowColor = Colors.blue.shade900;
        break;
      case WeatherCondition.cloudy:
      case WeatherCondition.foggy:
      case WeatherCondition.rainy:
      case WeatherCondition.thunderstorm:
      case WeatherCondition.windy:
      default:
        _backgroundColor = Colors.grey.shade300;
        _textColor = Colors.grey;
        _textShadowColor = Colors.grey.shade700;
        break;
    }
  }

  /// Adjusts colors conditional on [Brightness].
  void _adjustColors(Brightness brightness) {
    if (brightness == Brightness.dark) {
      _backgroundColor = TinyColor(_backgroundColor).darken(50).color;
      _textColor = TinyColor(_textColor).darken(40).color;
      _textShadowColor = TinyColor(_textShadowColor).darken(30).color;
    }
  }
}
