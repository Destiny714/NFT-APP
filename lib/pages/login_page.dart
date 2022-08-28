import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/extend.dart';
import '../network/apis.dart';
import '../network/dio_seal/wrapper.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../utils/regex_rule.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  RxString tip = '发送验证码'.obs;
  String? phoneNum;
  FocusNode node = FocusNode();
  Timer? countTimer;
  RxInt msgTimerCount = 0.obs;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    countTimer?.cancel();
    countTimer = null;
    super.dispose();
  }

  startMsgCount() {
    final int startTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    setState(() {
      msgTimerCount.value = 60;
    });
    countTimer?.cancel();
    countTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      msgTimerCount.value =
          60 - (DateTime.now().millisecondsSinceEpoch ~/ 1000 - startTime);
      tip.value = '${msgTimerCount.value}秒后重发';
      if (msgTimerCount.value == 0) {
        setState(() {
          msgTimerCount.value = 0;
        });
        tip.value = '发送验证码';
        timer.cancel();
        countTimer = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        floatingActionButton: msgTimerCount.value != 0
            ? CupertinoButton(
                padding: EdgeInsets.zero,
                child: '输入验证码'.text(),
                onPressed: () {
                  Get.toNamed('/pinCode', arguments: phoneNum);
                },
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 1),
              Padding(
                padding: EdgeInsets.all(5.w),
                child: '请输入手机号登录'.text(color: Colors.black87, size: 8.w),
              ),
              Padding(
                padding: EdgeInsets.all(4.w),
                child: Container(
                  height: 7.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38, width: 0.3.w),
                    borderRadius: BorderRadius.circular(4.w),
                    color: Colors.transparent,
                  ),
                  alignment: Alignment.topCenter,
                  child: TextField(
                    focusNode: node,
                    onChanged: (s) {
                      setState(() => phoneNum = s);
                      if (phoneNum?.length == 11) {
                        node.unfocus();
                      }
                    },
                    style: TextStyle(fontSize: 7.w),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 3.w),
                      hintStyle: TextStyle(fontSize: 5.w),
                      icon: Padding(
                        padding: EdgeInsets.only(top: 3.3.w),
                        child: ' +86'.text(color: Colors.black38, size: 5.w),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.w),
                child: Obx(
                  () => MaterialButton(
                    disabledColor: Colors.black12,
                    disabledTextColor: Colors.black45,
                    splashColor: Colors.grey,
                    highlightColor: Colors.grey,
                    elevation: 0,
                    color: Colors.black,
                    textColor: Colors.white,
                    minWidth: double.infinity,
                    height: 6.h,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.w)),
                    onPressed: (!regexPhoneNum(phoneNum) ||
                            msgTimerCount.value != 0)
                        ? null
                        : () async {
                            if (node.hasFocus) node.unfocus();
                            await apiWrapper(sendMessage(phoneNum!))
                                .then((value) async {
                              if (value) {
                                startMsgCount();
                                Get.toNamed('/pinCode', arguments: phoneNum);
                              } else {
                                await apiWrapper(
                                        registerAndSendMessage(phoneNum!))
                                    .then((value) {
                                  if (value) {
                                    startMsgCount();
                                    Get.toNamed('/pinCode',
                                        arguments: phoneNum);
                                  }
                                });
                              }
                            });
                          },
                    child: tip.value.text(size: 5.w),
                  ),
                ),
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
