import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geekshop/network/apis.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../utils/extend.dart';

class PinCodePage extends StatefulWidget {
  const PinCodePage({Key? key}) : super(key: key);

  @override
  State<PinCodePage> createState() => _PinCodePageState();
}

class _PinCodePageState extends State<PinCodePage> {
  TextEditingController controller = TextEditingController();
  final FocusNode node = FocusNode();
  String phoneNum = Get.arguments as String;

  @override
  void initState() {
    Timer(const Duration(milliseconds: 500), () {
      node.requestFocus();
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
    node.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 5.h,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Pinput(
          controller: controller,
          keyboardType: TextInputType.number,
          focusNode: node,
          defaultPinTheme: PinTheme(
            width: 13.w,
            height: 13.w,
            margin: EdgeInsets.only(left: 1.w, right: 1.w),
            textStyle: TextStyle(
                fontSize: 6.w, color: Colors.blueGrey, fontFamily: 'misans'),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black45),
              borderRadius: BorderRadius.circular(4.w),
            ),
          ),
          length: 6,
          onCompleted: (s) async {
            await login(phoneNumber: phoneNum, msgCode: s).then((value) {
              if (value) {
                Get.offAllNamed('/market');
              } else {
                controller.clear();
                Get.back();
              }
            });
          },
        ),
      ),
    );
  }
}
