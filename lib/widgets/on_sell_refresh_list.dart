import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:geekshop/models/commodity_detail_entity.dart';
import 'package:geekshop/models/sub_commodity_entity.dart';
import 'package:get/get.dart';
import '../models/commodity_list_entity.dart';
import '../network/apis.dart';
import '../utils/extend.dart';

import 'on_sell_card.dart';

class OnSellRefreshList extends StatefulWidget {
  const OnSellRefreshList({Key? key, required this.detail}) : super(key: key);
  final CommodityDetailData detail;

  @override
  State<OnSellRefreshList> createState() => _OnSellRefreshListState();
}

class _OnSellRefreshListState extends State<OnSellRefreshList>
    with SingleTickerProviderStateMixin {
  int pageNow = 1;
  final AsyncMemoizer _memoizer = AsyncMemoizer();
  List<SubCommodityRows> itemDetails = [];
  late final AnimationController _ctrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Future refreshData() async {
    pageNow = 1;
    await getSubCommodityList(widget.detail.id!)
        .then((value) => setState(() => itemDetails = value!));
    await HapticFeedback.vibrate();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _memoizer.runOnce(() async => await refreshData()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return EasyRefresh(
              header: CustomHeader(
                  extent: 12.h,
                  triggerDistance: 12.h + 10,
                  headerBuilder: (BuildContext context,
                      RefreshMode refreshState,
                      double pulledExtent,
                      double refreshTriggerPullDistance,
                      double refreshIndicatorExtent,
                      AxisDirection axisDirection,
                      bool float,
                      Duration? completeDuration,
                      bool enableInfiniteRefresh,
                      bool success,
                      bool noMore) {
                    double pullDistance = pulledExtent > refreshIndicatorExtent
                        ? refreshIndicatorExtent
                        : pulledExtent;
                    if (refreshState == RefreshMode.armed &&
                        !_ctrl.isAnimating) {
                      _ctrl.repeat();
                    } else if (refreshState != RefreshMode.armed &&
                        _ctrl.isAnimating) {
                      _ctrl.reset();
                    }
                    return Padding(
                      padding: EdgeInsets.only(top: pullDistance / 5),
                      child: Container(
                        alignment: Alignment.center,
                        height: 10.h,
                        child: refreshState == RefreshMode.armed
                            ? AnimatedOpacity(
                                opacity: _ctrl.value,
                                duration: const Duration(milliseconds: 300),
                                child: '极市'.text(size: 7.w, color: Colors.grey),
                              )
                            : Transform.scale(
                                scale: pullDistance / refreshIndicatorExtent,
                                child: '极市'.text(size: 7.w, color: Colors.grey),
                              ),
                      ),
                    );
                  }),
              footer: CustomFooter(
                  extent: 12.h,
                  triggerDistance: 12.h + 10,
                  footerBuilder: (BuildContext context,
                      LoadMode loadState,
                      double pulledExtent,
                      double refreshTriggerPullDistance,
                      double refreshIndicatorExtent,
                      AxisDirection axisDirection,
                      bool float,
                      Duration? completeDuration,
                      bool enableInfiniteRefresh,
                      bool success,
                      bool noMore) {
                    double pullDistance = pulledExtent > refreshIndicatorExtent
                        ? refreshIndicatorExtent
                        : pulledExtent;
                    if (loadState == LoadMode.armed && !_ctrl.isAnimating) {
                      _ctrl.repeat();
                    } else if (loadState != LoadMode.armed &&
                        _ctrl.isAnimating) {
                      _ctrl.reset();
                    }
                    return Padding(
                      padding: EdgeInsets.only(top: pullDistance / 5),
                      child: Container(
                        alignment: Alignment.center,
                        height: 10.h,
                        child: loadState == LoadMode.armed
                            ? AnimatedOpacity(
                                opacity: _ctrl.value,
                                duration: const Duration(milliseconds: 300),
                                child: '极市'.text(size: 7.w, color: Colors.grey),
                              )
                            : Transform.scale(
                                scale: pullDistance / refreshIndicatorExtent,
                                child: '极市'.text(size: 7.w, color: Colors.grey),
                              ),
                      ),
                    );
                  }),
              onRefresh: refreshData,
              onLoad: refreshData,
              child: GridView.custom(
                gridDelegate: SliverWovenGridDelegate.count(
                  crossAxisCount: 3,
                  pattern: [
                    const WovenGridTile(2 / 3),
                  ],
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) => OnSellCard(
                    detail: itemDetails.elementAt(index),
                    ancestorDetail: widget.detail,
                  ),
                  childCount: itemDetails.length,
                ),
              ),
            );
          } else {
            return const CupertinoActivityIndicator();
          }
        });
  }
}
