import 'package:flutter/material.dart';
import 'package:geekshop/utils/extend.dart';
import 'package:geekshop/widgets/image_slider.dart';
import 'package:geekshop/widgets/market_tab_bar.dart';
import 'package:geekshop/widgets/market_tab_view.dart';

class NestPage extends StatefulWidget {
  const NestPage({Key? key}) : super(key: key);

  @override
  NestPageState createState() => NestPageState();
}

class NestPageState extends State<NestPage> {

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, status) {
        return [
          SliverAppBar(
            elevation: 0,
            expandedHeight: 21.h,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: ImageSlider(
                width: 90.w,
                height: 14.h,
                images: const [
                  AssetImage('assets/images/portrait.png'),
                  NetworkImage(
                      'http://geekshop-test-env.oss-cn-hangzhou.aliyuncs.com/wallpaper/wallhaven-g8r9qe.jpeg'),
                  NetworkImage(
                      'http://geekshop-test-env.oss-cn-hangzhou.aliyuncs.com/wallpaper/wallhaven-733m1y.png'),
                ],
              ),
            ),
            backgroundColor: Colors.white,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(5.5.h),
              child: const Material(
                type: MaterialType.canvas,
                shadowColor: Colors.transparent,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: MarketTabBar(),
                ),
              ),
            ),
          )
        ];
      },
      body: const MarketTabView(),
    );
  }
}
