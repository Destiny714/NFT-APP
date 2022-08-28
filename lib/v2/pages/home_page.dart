import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geekshop/pages/message_page.dart';
import 'package:geekshop/utils/push.dart';
import 'package:get/get.dart';
import '../../resources/models.dart';
import '../../utils/extend.dart';
import '../../pages/login_page.dart';
import '../../pages/setting_page.dart';
import '../../resources/prefs.dart';
import 'nest_page.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with WidgetsBindingObserver {
  int bottomBarIndex = 0;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        FlutterAppBadger.removeBadge();
        print('on fore ground');
        AppJPush.jPush.setAlias((deviceID ?? 'unKnown device').replaceAll('-', ''));
        break;
      case AppLifecycleState.inactive:
        print('change to back ground');
        AppJPush.jPush.deleteAlias();
        break;
      case AppLifecycleState.paused:
        print('on back ground');
        AppJPush.jPush.deleteAlias();
        break;
      case AppLifecycleState.detached:
        print('ready to exit');
        AppJPush.jPush.deleteAlias();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: userDetailData?.verifiedState == '0'
          ? TextButton(
              onPressed: () => Get.toNamed('/realName'),
              child: Container(
                width: 30.w,
                height: 4.h,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(4.w)),
                alignment: Alignment.center,
                child: '实名认证'.text(color: Colors.black),
              ),
            )
          : null,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: ['极市', '消息', '我的']
            .elementAt(bottomBarIndex)
            .text(color: Colors.black),
        toolbarHeight: 4.h,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 1.w,
        currentIndex: bottomBarIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          setState(() {
            bottomBarIndex = index;
            pageController.jumpToPage(index);
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.local_mall_outlined), label: '首页'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.mail), label: '消息'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: '我的'),
        ],
      ),
      body: PageView(
        physics: const BouncingScrollPhysics(),
        onPageChanged: (page) {
          setState(() => bottomBarIndex = page);
        },
        controller: pageController,
        children: [
          const NestPage(),
          const MessagePage(),
          token == '' ? const LoginPage() : const SettingPage(),
        ],
      ),
    );
  }
}
