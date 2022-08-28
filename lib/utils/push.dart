import 'package:geekshop/resources/models.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';

class AppJPush {
  static final JPush jPush = JPush();

  static Future<void> initialized() async {
    jPush.setup(
      appKey: '8cd63f0981ccbcae5a054e0a',
      channel: 'theChannel',
      production: false,
      debug: true,
    );

    jPush.setAlias((deviceID ?? 'unKnown device').replaceAll('-', ''));

    jPush.applyPushAuthority(
        const NotificationSettingsIOS(sound: true, alert: true, badge: false));
    jPush.addEventHandler(
      onReceiveNotification: (Map<String, dynamic> message) async {
        print(message);
      },
      onOpenNotification: (Map<String, dynamic> message) async {
        FlutterAppBadger.removeBadge();
      },
    );
  }
}
