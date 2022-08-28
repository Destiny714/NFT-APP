import 'package:flutter/material.dart';

import '../resources/res.dart';

class MarketTabView extends StatefulWidget {
  const MarketTabView({Key? key}) : super(key: key);

  @override
  State<MarketTabView> createState() => _MarketTabViewState();
}

class _MarketTabViewState extends State<MarketTabView>
    with SingleTickerProviderStateMixin {
  TabBarView view() => TabBarView(
        physics: const BouncingScrollPhysics(),
        controller: Control().tabController ??=
            TabController(length: Immutable().tabData.length, vsync: this),
        children: Immutable()
            .tabData
            .map((e) => e.page ?? const Icon(Icons.clear))
            .toList(),
      );

  @override
  Widget build(BuildContext context) {
    return view();
  }
}
