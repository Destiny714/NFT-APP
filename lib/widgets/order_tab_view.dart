import 'package:flutter/material.dart';

import '../resources/res.dart';

class OrderTabView extends StatefulWidget {
  const OrderTabView({Key? key}) : super(key: key);

  @override
  State<OrderTabView> createState() => _OrderTabViewState();
}

class _OrderTabViewState extends State<OrderTabView>
    with SingleTickerProviderStateMixin {
  TabBarView view() => TabBarView(
        physics: const BouncingScrollPhysics(),
        controller: Control().orderTabController ??=
            TabController(length: Immutable().orderTabData.length, vsync: this),
        children: Immutable()
            .orderTabData
            .map((e) => e.page ?? const Icon(Icons.clear))
            .toList(),
      );

  @override
  Widget build(BuildContext context) {
    return view();
  }
}
