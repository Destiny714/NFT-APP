import 'package:flutter/cupertino.dart';
import '../resources/models.dart';
import '../utils/extend.dart';

void showAlert({
  String? title,
  String? content,
  Function? onConfirm,
  Function? onDismiss,
  String? confirmText,
  String? dismissText,
  bool dismissible = true,
}) async {
  List<Widget> actions = [];
  if (onConfirm != null) {
    actions.add(
      CupertinoButton(
          child: (confirmText ?? 'confirm').text(),
          onPressed: () {
            Navigator.of(navigatorKey.currentContext!).pop();
            onConfirm();
          }),
    );
  }
  if (onDismiss != null) {
    actions.add(
      CupertinoButton(
          child: (dismissText ?? '关闭').text(size: 4.w, weight: FontWeight.bold),
          onPressed: () {
            Navigator.of(navigatorKey.currentContext!).pop();
            onDismiss();
          }),
    );
  }
  await showCupertinoDialog(
      barrierDismissible: dismissible,
      context: navigatorKey.currentContext!,
      builder: (_) {
        return CupertinoAlertDialog(
          title: title?.text(size: 4.5.w),
          content: content?.text(size: 3.5.w),
          actions: actions,
        );
      });
}
