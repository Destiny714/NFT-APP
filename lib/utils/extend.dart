import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../resources/color_design.dart';
import '../resources/res.dart';

extension SizeExtention on num {
  double get w => this * S.size.vw;

  double get h => this * S.size.vh;

  Text text({Color? color, double? size, int? maxLines, FontWeight? weight}) {
    return Text(
      toString(),
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
        fontFamily: 'misans',
        decoration: TextDecoration.none,
      ),
      maxLines: maxLines,
      overflow: TextOverflow.clip,
    );
  }

  EdgeInsetsGeometry get padding => EdgeInsets.all(toDouble());

  num get price => this % 1 == 0 ? toInt() : this;

  Color get color => [primary1, primary2, primary3].elementAt(toInt() - 1);
}

extension StringExtension on String {
  Text text({Color? color, double? size, int? maxLines, FontWeight? weight}) {
    return Text(
      this,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
        fontFamily: 'misans',
        decoration: TextDecoration.none,
      ),
      maxLines: maxLines,
      overflow: TextOverflow.clip,
    );
  }
}

extension WidgetExtension on Widget {
  Padding pd(double? paddingAll, {EdgeInsetsGeometry? padding}) {
    EdgeInsetsGeometry finalPadding = EdgeInsets.zero;
    if (paddingAll != null) {
      finalPadding = EdgeInsets.all(paddingAll);
    } else if (padding != null) {
      finalPadding = padding;
    }
    return Padding(padding: finalPadding, child: this);
  }

  Badge badge(
      {Widget? content,
      Color? color,
      EdgeInsetsGeometry? padding,
      BorderSide borderSide = BorderSide.none}) {
    return Badge(
      elevation: 0,
      badgeContent: content,
      badgeColor: color ?? Colors.red,
      padding: padding ?? EdgeInsets.all(1.5.w),
      borderSide: borderSide,
      child: this,
    );
  }

  GestureDetector tap(Function() onTap) {
    return GestureDetector(onTap: onTap, child: this);
  }
}
