import 'package:flutter/material.dart';
import 'package:geekshop/utils/extend.dart';
import 'package:geekshop/widgets/market_tab_bar.dart';

import '../../widgets/market_tab_view.dart';
import '../../widgets/order_tab_bar.dart';
import '../../widgets/order_tab_view.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: '我的订单'.text(),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(5.5.h),
          child: const Material(
            type: MaterialType.canvas,
            shadowColor: Colors.transparent,
            color: Colors.white,
            child: Align(
              alignment: Alignment.center,
              child: OrderTabBar(),
            ),
          ),
        ),
      ),
      body: const OrderTabView(),
    );
  }
}
