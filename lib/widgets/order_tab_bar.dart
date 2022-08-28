import 'package:flutter/material.dart';
import '../utils/extend.dart';

import '../resources/res.dart';

class OrderTabBar extends StatefulWidget {
  const OrderTabBar({Key? key}) : super(key: key);

  @override
  State<OrderTabBar> createState() => _OrderTabBarState();
}

class _OrderTabBarState extends State<OrderTabBar>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Control().orderTabController ??=
        TabController(length: Immutable().orderTabData.length, vsync: this);
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
        controller: Control().orderTabController,
      );

  List<Widget> tabs() => Immutable()
      .orderTabData
      .map(
        (e) => Tab(
          iconMargin: EdgeInsets.zero,
          child: Container(
            width: 17.w,
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
