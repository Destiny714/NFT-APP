import 'dart:async';

import 'package:aliyun_oss_flutter/aliyun_oss_flutter.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_detail_entity.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey();
late SharedPreferences prefs;
Timer? msgCodeTimer;
UserDetailData? userDetailData;
String? deviceID;
late OSSClient ossClient;