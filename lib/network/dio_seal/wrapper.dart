import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/extend.dart';

import '../../resources/models.dart';

Future<dynamic> apiWrapper(Future<dynamic> func,
    {BuildContext? context}) async {
  dynamic res;
  await showDialog(
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      context: context ?? navigatorKey.currentContext!,
      builder: (_) {
        return FutureBuilder(
          future: func.then((value) {
            res = value;
            if (res != null) {
              Navigator.of(context ?? navigatorKey.currentContext!).pop();
            }
          }),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Container();
              case ConnectionState.waiting:
                return const CupertinoActivityIndicator();
              case ConnectionState.done:
                if (res == null) {
                  return CupertinoAlertDialog(
                    title: '请求出问题了'.text(),
                    actions: [
                      CupertinoButton(
                          child: ('取消').text(),
                          onPressed: () {
                            Navigator.of(navigatorKey.currentContext!).pop();
                          }),
                      CupertinoButton(
                          child: ('点击重试').text(),
                          onPressed: () async {
                            Navigator.of(navigatorKey.currentContext!).pop();
                            res = await apiWrapper(func);
                          }),
                    ],
                  );
                } else {
                  return Container();
                }
              default:
                return Container();
            }
          },
        );
      });
  return res;
}
