import 'package:flutter/material.dart';

import '../widgets/forecast_refresh_list.dart';
import '../widgets/new_refresh_list.dart';
import '../widgets/on_sell_refresh_list.dart';

class S {
  static final S size = S._internal();

  factory S() {
    return size;
  }

  S._internal();

  late double vw;
  late double vh;
}

class Control {
  static final Control controls = Control._internal();

  factory Control() {
    return controls;
  }

  Control._internal();

  late ScrollController primaryController;
  TabController? tabController;
  TabController? orderTabController;
}

class Immutable {
  final List<TabModel> tabData = [
    TabModel(title: '近期发售', page: const NewRefreshList()),
    TabModel(title: '发售日历', page: const ForecastRefreshList()),
  ];

  final List<TabModel> orderTabData = [
    TabModel(title: '全部订单', page: Container()),
    TabModel(title: '进行中', page: Container()),
    TabModel(title: '已完成', page: Container()),
    TabModel(title: '已取消', page: Container()),
  ];
}

class TabModel {
  final String title;
  final Widget? page;

  TabModel({required this.title, this.page});
}

class OverlayCollection {
  static final OverlayCollection overlayCollection =
      OverlayCollection._internal();

  factory OverlayCollection() {
    return overlayCollection;
  }

  OverlayCollection._internal();

  Map<Key, OverlayEntry> overlayMap = {};
}
