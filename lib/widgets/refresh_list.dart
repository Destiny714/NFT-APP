import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:geekshop/utils/extend.dart';

class RefreshList extends StatefulWidget {
  const RefreshList(
      {Key? key,
      required this.child,
      required this.onLoad,
      required this.onRefresh})
      : super(key: key);
  final Widget child;
  final Future Function() onLoad;
  final Future Function() onRefresh;

  @override
  RefreshListState createState() => RefreshListState();
}

class RefreshListState extends State<RefreshList>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      onRefresh: widget.onRefresh,
      onLoad: widget.onLoad,
      child: widget.child,
    );
  }
}
