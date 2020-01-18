import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

/// Displays text with shadow.
class ShadowText extends StatelessWidget {
  //
  final String data;
  final TextStyle style;
  final double scaleFactor;

  ShadowText({
    @required this.data,
    this.style,
    this.scaleFactor,
  });

  Widget build(BuildContext context) {
    final textStyle = style ?? TextStyle();

    return ClipRect(
      child: Padding(
        padding: EdgeInsets.all(e),
        child: Stack(
          children: [
            Text(
              data,
              style: textStyle.copyWith(color: Colors.black),
              textScaleFactor: scaleFactor,
            ),
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: sqrt2,
                  sigmaY: sqrt2,
                ),
                child: Text(
                  data,
                  style: textStyle,
                  textScaleFactor: scaleFactor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
