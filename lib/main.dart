import 'package:flutter/material.dart';
import 'package:geekshop/pages/real_name_auth_page.dart';
import 'package:geekshop/v2/pages/home_page.dart';
import 'package:geekshop/v2/pages/order_page.dart';
import 'package:get/get.dart';
import 'pages/loading_page.dart';
import 'pages/login_page.dart';
import 'pages/market_page.dart';
import 'pages/pin_code_page.dart';
import 'resources/models.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    navigatorKey: navigatorKey,
    initialRoute: '/',
    routes: {
      '/': (context) => const LoadingPage(),
      '/market': (context) => const HomePage(),
      '/login': (context) => const LoginPage(),
      '/pinCode': (context) => const PinCodePage(),
      '/realName': (context) => const RealNameAuthPage(),
      '/order': (context) => const OrderPage(),
    },
  ));
}
