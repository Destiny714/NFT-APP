import 'dart:io';
import 'dart:async';
import 'package:geekshop/network/oss.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:get/get.dart';
import '../network/apis.dart';
import '../resources/res.dart';
import '../utils/extend.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../resources/models.dart';
import '../utils/push.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _scaleController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 600));
  late Animation<double> scaleAnimation = Tween<double>(begin: 1.0, end: 0.35)
      .chain(CurveTween(curve: Curves.ease))
      .animate(_scaleController);
  bool onError = false;
  Timer? typeTimer;
  String markText = 'Geek Shop';
  int currentIndex = 0;

  String get currentMark => markText.substring(0, currentIndex);
  final ValueNotifier<String> typeNotifier = ValueNotifier<String>("");

  @override
  void initState() {
    initOSS();
    if (!kIsWeb) {
      FlutterAppBadger.removeBadge();
      initDeviceInfo();
      AppJPush.initialized();
      SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    }
    Future.delayed(const Duration(seconds: 0), () async {
      prefs = await SharedPreferences.getInstance();
      _scaleController.forward();
      typeTimer = Timer.periodic(const Duration(milliseconds: 150), (timer) {
        if (currentIndex < markText.length) {
          currentIndex++;
          typeNotifier.value = currentMark;
        } else {
          timer.cancel();
        }
      });
      await Future.delayed(const Duration(seconds: 2));
      initStep();
    });
    super.initState();
  }

  @override
  void dispose() {
    _scaleController.dispose();
    typeTimer?.cancel();
    super.dispose();
  }

  void initDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      deviceID = 'ios-${iosDeviceInfo.identifierForVendor}';
    } else {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
        print(androidDeviceInfo.androidId);
        deviceID = 'android-${androidDeviceInfo.androidId}';
      }
    }
    print('deviceID:$deviceID');
  }

  initStep() async {
    setState(() {
      onError = false;
    });
    try {
      await updateUserDetail();
      await getCommodityList()
          .then((value) => Get.offNamed('/market', arguments: value));
    } catch (e) {
      setState(() {
        onError = true;
      });
      ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
        backgroundColor: Colors.black12,
        content: '网络请求出错，点击以重新加载'.text(),
        actions: [
          GestureDetector(
            child: const Icon(CupertinoIcons.refresh),
            onTap: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              initStep();
            },
          )
        ],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    S.size.vw = size.width;
    S.size.vh = size.height;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: 2.color,
        child: Container(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              onError
                  ? GestureDetector(
                      child: Icon(CupertinoIcons.slowmo,
                          size: 30.w, color: Colors.black87),
                      onTap: () {
                        ScaffoldMessenger.of(context)
                            .hideCurrentMaterialBanner();
                        initStep();
                      },
                    )
                  : SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                        color: Colors.black45,
                        strokeWidth: 0.5.w,
                      ),
                    ),
              ScaleTransition(
                scale: scaleAnimation,
                child: '极市'.text(size: 15.w, color: 3.color),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedBuilder(
                    builder: (_, __) {
                      return currentMark.text(size: 8.w, color: 3.color);
                    },
                    animation: typeNotifier,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
