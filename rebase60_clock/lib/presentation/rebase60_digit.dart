import 'package:flutter/material.dart';
import 'package:basic_utils/basic_utils.dart';

import '../utils/rebase60.dart';

/// [ReBase60Digit] display modes.
enum DisplayMode {
  /// In [standard] mode, each [ReBase60] digit is presented with its respective 
  /// character.
  standard,

  /// In [uppercase] mode, all [ReBase60] digits are presented in uppercase.
  /// Digits A-Y (31-55) are underlined, to distinguish them from
  /// digits a-y (1-25).
  uppercase,
}

/// Displays a single [ReBase60] digit.
class ReBase60Digit extends StatelessWidget {
  //
  final int code;
  final double scaleFactor;
  final DisplayMode displayMode;
  final _converter = const ReBase60();

  ReBase60Digit({
    Key key,
    @required this.code,
    this.displayMode,
    this.scaleFactor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rb60Digit = _converter.decode(code);

    if (displayMode == DisplayMode.uppercase) {
      return Text(
        rb60Digit.toUpperCase(),
        textScaleFactor: scaleFactor,
        style: _textStyle(rb60Digit),
      );
    } else {
      return Text(
        rb60Digit,
        textScaleFactor: scaleFactor,
      );
    }
  }

  /// Provides underlined text style to the uppercase digits of [ReBase60].
  TextStyle _textStyle(String rb60Digit) {
    if (!StringUtils.isDigit(rb60Digit) && StringUtils.isUpperCase(rb60Digit)) {
      return TextStyle(decoration: TextDecoration.underline);
    } else {
      return null;
    }
  }
}
