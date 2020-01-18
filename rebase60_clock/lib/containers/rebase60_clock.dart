import 'dart:async';
import 'dart:math';

import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/material.dart';

import '../presentation/rebase60_digit.dart';
import '../utils/app_theme.dart';

/// In the context of [Flutter Clock](https://flutter.dev/clock) contest,
/// and since [ClockCustomizer] is not allowed to be modified, this widget
/// could be tought of as a root widget.
class ReBase60Clock extends StatefulWidget {
  //
  const ReBase60Clock(this.model);

  final ClockModel model;

  @override
  _ReBase60ClockState createState() => _ReBase60ClockState();
}

/// State for [ReBase60Clock].
///
/// GUI is created in the [build] method.
class _ReBase60ClockState extends State<ReBase60Clock> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(ReBase60Clock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  void _updateModel() {
    setState(() {
      // Cause the clock to rebuild when the model changes.
    });
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();
      _timer = Timer(
        Duration(seconds: 1) - Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme(
      Theme.of(context),
      widget.model,
    );
    final flexUpper = ((100 - appTheme.temperatureIndex) / 100 * 67).round();
    final flexLower = 100 - flexUpper;

    return Container(
      color: appTheme.backgroundColor,
      child: DefaultTextStyle(
        style: _textStyle(appTheme),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            ReBase60Digit(
              code: _dateTime.hour,
              displayMode: appTheme.displayMode,
            ),
            ReBase60Digit(
              code: _dateTime.minute,
              displayMode: appTheme.displayMode,
            ),
            Column(
              children: <Widget>[
                Flexible(
                  flex: flexUpper,
                  child: Container(),
                ),
                Flexible(
                  flex: flexLower,
                  child: ReBase60Digit(
                    code: _dateTime.second,
                    displayMode: appTheme.displayMode,
                    scaleFactor: 1 / 3,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  /// Creates themed [TextStyle].
  TextStyle _textStyle(AppTheme appTheme) {
    return TextStyle(
      color: appTheme.textColor,
      fontFamily: appTheme.fontFamily,
      fontSize: MediaQuery.of(context).size.width / sqrt(5),
      shadows: [
        Shadow(
          blurRadius: 0,
          color: appTheme.textShadowColor,
          offset: Offset(sqrt2, sqrt2),
        ),
      ],
    );
  }
}
