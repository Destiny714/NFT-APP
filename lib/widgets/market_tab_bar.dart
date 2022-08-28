import 'package:flutter/material.dart';
import '../utils/extend.dart';

import '../resources/res.dart';

class MarketTabBar extends StatefulWidget {
  const MarketTabBar({Key? key}) : super(key: key);

  @override
  State<MarketTabBar> createState() => _MarketTabBarState();
}

class _MarketTabBarState extends State<MarketTabBar>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Control().tabController ??=
        TabController(length: Immutable().tabData.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  TabBar bar() => TabBar(
        physics: const BouncingScrollPhysics(),
        tabs: tabs(),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        automaticIndicatorColorAdjustment: true,
        labelColor: Colors.red,
        unselectedLabelColor: Colors.black,
        isScrollable: true,
        indicatorColor: Colors.red,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: const EdgeInsets.all(2),
        indicatorWeight: 1.w / 2,
        controller: Control().tabController,
      );

  List<Widget> tabs() => Immutable()
      .tabData
      .map(
        (e) => Tab(
          iconMargin: EdgeInsets.zero,
          child: Container(
            width: 20.w,
            alignment: Alignment.center,
            child: e.title.text(size: 4.w),
          ),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return bar();
  }
}
