import 'package:flutter/material.dart';
import 'package:geekshop/network/apis.dart';
import 'package:geekshop/utils/toast.dart';
import '../utils/regex_rule.dart';
import 'package:get/get.dart';
import '../utils/extend.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class RealNameAuthPage extends StatefulWidget {
  const RealNameAuthPage({Key? key}) : super(key: key);

  @override
  RealNameAuthPageState createState() => RealNameAuthPageState();
}

class RealNameAuthPageState extends State<RealNameAuthPage> {
  final formKey = GlobalKey<FormState>();
  final FocusNode node = FocusNode();
  bool confirmPolicy = true;
  String name = '';
  String idCard = '';

  @override
  void dispose() {
    node.unfocus();
    node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: 3.color,
          title: '实名认证'.text(),
          elevation: 0,
        ),
        body: Stack(
          children: [
            Center(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 1),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: '实名认证资料'.text(size: 5.w),
                    ).pd(null, padding: EdgeInsets.only(left: 7.w)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: '*应国家法律法规要求，购买前需完成实名认证'
                          .text(size: 3.5.w, color: Colors.black38),
                    ).pd(null, padding: EdgeInsets.only(left: 7.w)),
                    const Spacer(flex: 1),
                    TextFormField(
                      autofocus: false,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (s) => name = s,
                      validator: (s) {
                        return regexName(s);
                      },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        hintText: '请输入姓名',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.w)),
                      ),
                    ).pd(null, padding: EdgeInsets.only(left: 6.w, right: 6.w)),
                    const Spacer(flex: 1),
                    TextFormField(
                      onChanged: (s) => idCard = s,
                      autofocus: false,
                      keyboardType:
                          const TextInputType.numberWithOptions(signed: true),
                      validator: (s) {
                        return regexIdCard(s);
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        hintText: '请输入身份证',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.w)),
                      ),
                    ).pd(null, padding: EdgeInsets.only(left: 6.w, right: 6.w)),
                    const Spacer(flex: 1),
                    Row(
                      children: [
                        Checkbox(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            activeColor: Colors.black,
                            value: confirmPolicy,
                            onChanged: (s) {
                              setState(() {
                                confirmPolicy = !confirmPolicy;
                              });
                            }),
                        '我已阅读并同意'.text(),
                        '《极市用户隐私协议》'.text(color: Colors.blue),
                      ],
                    ).pd(null, padding: EdgeInsets.only(left: 4.w)),
                    MaterialButton(
                      onPressed: () async {
                        bool result = formKey.currentState?.validate() ?? false;
                        if (result) {
                          if (confirmPolicy) {
                            node.unfocus();
                            await realNameVerify(name: name, idCard: idCard)
                                .then((value) {
                              if (value) {
                                Get.back();
                              } else {
                                showToast('实名认证失败');
                              }
                            });
                          } else {
                            showToast('请同意隐私协议');
                          }
                        }
                      },
                      minWidth: 80.w,
                      height: 5.h,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.w)),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      highlightElevation: 0,
                      color: 1.color,
                      child: '提交'.text(color: Colors.white, size: 5.w),
                    ),
                    const Spacer(flex: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
