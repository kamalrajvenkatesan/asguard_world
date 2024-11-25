import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget toCenter() => Center(child: this);

  Widget addPadding(
          {double top = 0.0,
          double bottom = 0.0,
          double left = 0.0,
          double right = 0.0}) =>
      Padding(
        padding:
            EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
        child: this,
      );
}
