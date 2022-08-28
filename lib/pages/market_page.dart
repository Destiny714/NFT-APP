import 'package:flutter/material.dart';
import 'package:geekshop/pages/login_page.dart';
import 'package:get/get.dart';
import '../resources/models.dart';
import '../resources/prefs.dart';
import '../utils/extend.dart';
import '../pages/setting_page.dart';
import '../resources/res.dart';
import '../widgets/market_tab_bar.dart';
import '../widgets/market_tab_view.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({Key? key}) : super(key: key);

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> with TickerProviderStateMixin {
  int bottomBarIndex = 0;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    print('home dispose');
    super.dispose();
  }

  Widget? getAppBar(int index) {
    switch (index) {
      case 0:
        return null;
      case 1:
        return '收件箱'.text(color: Colors.black, size: 4.w);
      case 2:
        return '设置'.text(color: Colors.black, size: 4.w);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Control.controls.primaryController = PrimaryScrollController.of(context)!;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: userDetailData == null
          ? null
          : userDetailData?.verifiedState == '1'
              ? null
              : MaterialButton(
                  onPressed: () {
                    Get.toNamed('/realName');
                  },
                  padding: EdgeInsets.zero,
                  height: 4.h,
                  splashColor: Colors.transparent,
                  elevation: 0.1,
                  highlightColor: null,
                  highlightElevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.w)),
                  color: Colors.black54,
                  child: '实名认证'.text(color: Colors.white, size: 3.5.w),
                ),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.2,
        backgroundColor: Colors.white,
        title: getAppBar(bottomBarIndex),
        bottom: bottomBarIndex == 0
            ? PreferredSize(
                preferredSize: Size.fromHeight(0.h),
                child: const Material(
                  type: MaterialType.canvas,
                  shadowColor: Colors.transparent,
                  color: Colors.white,
                  child: MarketTabBar(),
                ),
              )
            : null,
      ),
      body: PageView(
        physics: const BouncingScrollPhysics(),
        onPageChanged: (page) {
          setState(() => bottomBarIndex = page);
        },
        controller: pageController,
        children: [
          const MarketTabView(),
          Container(),
          token == '' ? const LoginPage() : const SettingPage(),
        ],
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
              icon: Icon(Icons.local_mall_outlined), label: '市场'),
          BottomNavigationBarItem(icon: Icon(Icons.mail_outline), label: '消息'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: '我的'),
        ],
      ),
    );
  }
}

class TabModel {
  final String title;
  final Widget? page;

  TabModel({required this.title, this.page});
}
