import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:geekshop/models/commodity_list_entity.dart';
import 'package:get/get.dart';

import '../network/apis.dart';
import '../utils/extend.dart';
import '../widgets/new_card.dart';

class NewRefreshList extends StatefulWidget {
  const NewRefreshList({Key? key}) : super(key: key);

  @override
  State<NewRefreshList> createState() => _NewRefreshListState();
}

class _NewRefreshListState extends State<NewRefreshList>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  int pageNow = 1;
  List<CommodityListRows> itemDetails = [];
  late final AnimationController _ctrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (Get.arguments == null) {
      Timer.run(() async {
        await refreshData();
      });
    } else {
      itemDetails = Get.arguments as List<CommodityListRows>;
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Future refreshData() async {
    pageNow = 1;
    try{
      await getCommodityList().then((value) {
        setState(() => itemDetails = value!);
      });
    }catch(e){

    }
    await HapticFeedback.vibrate();
  }

  Future addData() async {
    await getCommodityList().then((value) {
      setState(() => itemDetails.addAll(value!));
    });
    await HapticFeedback.vibrate();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
            if (refreshState == RefreshMode.armed && !_ctrl.isAnimating) {
              _ctrl.repeat();
            } else if (refreshState != RefreshMode.armed && _ctrl.isAnimating) {
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
            } else if (loadState != LoadMode.armed && _ctrl.isAnimating) {
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
      onLoad: addData,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return NewCard(detail: itemDetails.elementAt(index));
        },
        itemCount: itemDetails.length,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
