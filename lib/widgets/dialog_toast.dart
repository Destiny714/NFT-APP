import 'dart:async';
import 'package:flutter/material.dart';
import '../utils/extend.dart';

import '../resources/res.dart';

class DialogToast extends StatefulWidget {
  const DialogToast({
    Key? key,
    required this.msg,
    this.alignment = Alignment.bottomCenter,
    this.fontSize,
    this.maintainMilliSec = 2000,
    this.dismissMilliSec = 400,
  }) : super(key: key);
  final String msg;
  final AlignmentGeometry alignment;
  final double? fontSize;
  final int maintainMilliSec;
  final int dismissMilliSec;

  @override
  State<DialogToast> createState() => _DialogToastState();
}

class _DialogToastState extends State<DialogToast>
    with SingleTickerProviderStateMixin {
  late AnimationController controller = AnimationController(
      vsync: this, duration: Duration(milliseconds: widget.dismissMilliSec));

  double get opacity => 1 - controller.value;

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: widget.maintainMilliSec), () {
      controller
          .forward(from: 0)
          .then((value) => OverlayCollection().overlayMap[widget.key]?.remove());
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.alignment,
      child: AnimatedBuilder(
        animation: controller,
        builder: (_, __) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8 * opacity),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              widget.msg,
              softWrap: true,
              style: TextStyle(
                color: Colors.white.withOpacity(opacity),
                fontSize:
                    widget.fontSize ?? 4.w,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
              ),
            ),
          );
        },
      ),
    );
  }
}
