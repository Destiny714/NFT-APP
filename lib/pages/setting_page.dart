import 'dart:io';

import 'package:aliyun_oss_flutter/aliyun_oss_flutter.dart';
import 'package:async/async.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geekshop/network/apis.dart';
import 'package:geekshop/network/oss.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'package:system_settings/system_settings.dart';

import '../resources/models.dart';
import '../resources/prefs.dart';
import '../utils/dialog.dart';
import '../utils/extend.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final focusNode = FocusNode();
  AsyncMemoizer memoizer = AsyncMemoizer();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    focusNode.unfocus();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: memoizer.runOnce(() async => await updateUserDetail()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return KeyboardDismisser(
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () async {
                      final ImagePicker picker = ImagePicker();
                      try {
                        var chosenImage =
                            await picker.pickImage(source: ImageSource.gallery);
                        String? filePath = chosenImage?.path;
                        if (filePath != null) {
                          String imageUrl = await uploadOSS(
                              OSSImageObject.fromFile(file: File(filePath)));
                          print(imageUrl);
                        }
                      } catch (e) {
                        showAlert(
                            title: '提示',
                            content: e.toString(),
                            onConfirm: () async {
                              await SystemSettings.app();
                            });
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 100.w,
                      height: 20.h,
                      child: Badge(
                        padding: EdgeInsets.zero,
                        badgeColor: Colors.white,
                        elevation: 0,
                        position: BadgePosition(top: 7.h),
                        badgeContent: Container(
                          decoration: const BoxDecoration(
                              color: Color(0x05000000), shape: BoxShape.circle),
                          width: 7.w,
                          height: 7.w,
                          alignment: Alignment.center,
                          child: Container(
                            width: 5.w,
                            height: 5.w,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                color: Colors.white,
                                shape: BoxShape.circle),
                            alignment: Alignment.center,
                            child: '+'.text(),
                          ),
                        ),
                        child: ClipOval(
                          child: Image.network(
                            userDetailData!.portrait!,
                            width: 20.w,
                            height: 20.w,
                            fit: BoxFit.cover,
                            errorBuilder: (a, b, c) {
                              return Image.asset(
                                'assets/images/portrait.png',
                                width: 20.w,
                                height: 20.w,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                  settingTile(
                    title: '昵称',
                    showText: userDetailData?.nickname,
                    hint: '请输入昵称',
                  ),
                  const Divider(),
                  settingTile(
                    title: '钱包地址',
                    showText: userDetailData?.blockAddress,
                    hint: '实名认证后自动生成',
                  ),
                  const Divider(),
                  settingTile(
                    title: '手机',
                    showText: userDetailData?.phone,
                    hint: '请绑定手机',
                  ),
                  const Divider(),
                  settingTile(
                    title: '所有订单',
                    showIcon: Icon(Icons.arrow_forward_ios_outlined, size: 4.w),
                    hint: '请绑定手机',
                    onTap: () => Get.toNamed('/order'),
                  ),
                  const Divider(),
                  settingTile(
                    title: '配送信息',
                    showIcon: Icon(Icons.arrow_forward_ios_outlined, size: 4.w),
                    hint: '请绑定手机',
                  ),
                  const Divider(),
                  ListTile(
                    title: Center(child: '删除账户'.text(size: 4.w)),
                    onTap: () {},
                  ),
                  const Divider(),
                  ListTile(
                    title: Center(child: '退出登录'.text(size: 4.w)),
                    onTap: () {
                      Get.offAllNamed('/login');
                      token = '';
                    },
                  ),
                  const Divider(),
                ],
              ),
            );
          } else {
            return const CupertinoActivityIndicator();
          }
        });
  }

  Widget settingTile({
    required String title,
    String? showText = '',
    Icon? showIcon,
    Function(String)? onChanged,
    Function? onTap,
    String? hint,
    bool enableInput = false,
  }) {
    return ListTile(
      title: title.text(),
      focusColor: Colors.transparent,
      trailing: Container(
        alignment: Alignment.centerRight,
        height: 8.h,
        width: 50.w,
        child: showIcon ??
            TextField(
              enabled: enableInput,
              controller: TextEditingController(text: showText),
              cursorColor: Colors.black12,
              onChanged: onChanged,
              onEditingComplete: () {
                focusNode.unfocus();
              },
              maxLines: 1,
              textAlign: TextAlign.end,
              decoration:
                  InputDecoration(hintText: hint, border: InputBorder.none),
              focusNode: focusNode,
              keyboardType: TextInputType.name,
              style: TextStyle(fontSize: 4.w),
            ),
      ),
      onTap: () => onTap == null ? focusNode.requestFocus() : onTap(),
    );
  }
}
