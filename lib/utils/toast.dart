import 'package:flutter/material.dart';
import '../resources/models.dart';

import '../resources/res.dart';
import '../widgets/dialog_toast.dart';

void showToast(String msg) {
  Key key = UniqueKey();
  OverlayEntry entry =
      OverlayEntry(builder: (_) => DialogToast(key: key, msg: msg,alignment: Alignment.center));
  navigatorKey.currentState?.overlay?.insert(entry);
  OverlayCollection().overlayMap[key] = entry;
}
