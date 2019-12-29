import 'package:flutter/material.dart';
import 'package:basic_utils/basic_utils.dart';

import '../utils/rebase60.dart';

enum DisplayMode {
  standard,
  uppercase,
}

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
    final character = _converter.decode(code);

    if (displayMode == DisplayMode.uppercase) {
      return Text(
        character.toUpperCase(),
        textScaleFactor: scaleFactor,
        style: _textStyle(character),
      );
    } else {
      return Text(
        character,
        textScaleFactor: scaleFactor,
      );
    }
  }

  TextStyle _textStyle(String character) {
    if (!StringUtils.isDigit(character) && StringUtils.isUpperCase(character)) {
      return TextStyle(decoration: TextDecoration.underline);
    } else {
      return null;
    }
  }
}
