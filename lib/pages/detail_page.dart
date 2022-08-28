import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geekshop/pages/sub_market_page.dart';
import 'package:get/get.dart';
import '../models/commodity_detail_entity.dart';
import '../utils/extend.dart';
import '../network/apis.dart';
import '../widgets/buy_bottom_sheet.dart';
import '../widgets/image_slider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.id, this.suffix}) : super(key: key);
  final int id;
  final String? suffix;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late CommodityDetailData data;
  bool enableHero = false;
  final AsyncMemoizer _memoizer = AsyncMemoizer();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HeroMode(
      enabled: enableHero,
      child: Hero(
        tag: '${widget.suffix ?? "detail"}-${widget.id}',
        child: FutureBuilder(
            future: _memoizer.runOnce(() async =>
                await getCommodityDetail(widget.id)
                    .then((value) => data = value!)),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.waiting) {
                return Scaffold(
                  body: Stack(
                    children: [
                      ListView(
                        children: [
                          ImageSlider(
                            fit: BoxFit.cover,
                            width: 92.w,
                            height: 40.h,
                            images: [NetworkImage(data.remark!)],
                          ).pd(null, padding: EdgeInsets.only(top: 5.h)),
                          '系列简介'.text().pd(null,
                              padding: EdgeInsets.only(left: 5.w, top: 2.w)),
                          Container(
                            padding: EdgeInsets.only(
                                left: 3.w, top: 1.5.w, bottom: 1.w),
                            width: 100.w,
                            height: 14.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.w),
                                border: Border.all(color: Colors.grey),
                                color: Colors.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                '创作者:  创作者${data.creatorId!}'.text(
                                    size: 3.5.w,
                                    maxLines: 1,
                                    weight: FontWeight.bold),
                                '发行量:  ${data.stock!}'.text(
                                    size: 3.5.w,
                                    maxLines: 1,
                                    weight: FontWeight.bold),
                                '作品名:  ${data.name!}'.text(
                                    size: 3.5.w,
                                    maxLines: 1,
                                    weight: FontWeight.bold),
                                '发售时间:  ${data.createTime}'.text(
                                    size: 3.5.w,
                                    maxLines: 1,
                                    weight: FontWeight.bold),
                              ],
                            ),
                          ).pd(null,
                              padding: EdgeInsets.only(
                                  left: 4.w,
                                  right: 4.w,
                                  bottom: 2.w,
                                  top: 1.w)),
                          '作品故事'.text().pd(null,
                              padding: EdgeInsets.only(left: 5.w, top: 2.w)),
                          Container(
                            padding: EdgeInsets.all(3.w),
                            width: 100.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.w),
                                border: Border.all(color: Colors.grey),
                                color: Colors.white),
                            child: data.resume!
                                .text(size: 3.5.w, weight: FontWeight.bold),
                          ).pd(null,
                              padding: EdgeInsets.only(
                                  left: 4.w,
                                  right: 4.w,
                                  bottom: 2.w,
                                  top: 1.w)),
                          '权益说明'.text().pd(null,
                              padding: EdgeInsets.only(left: 5.w, top: 2.w)),
                          Container(
                            padding: EdgeInsets.all(3.w),
                            width: 100.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.w),
                                border: Border.all(color: Colors.grey),
                                color: Colors.white),
                            child: '购买此产品，可享有“极市”平台创世权益，创世权益将在后续陆续公告…'
                                .text(size: 3.5.w, weight: FontWeight.bold),
                          ).pd(null,
                              padding: EdgeInsets.only(
                                  left: 4.w,
                                  right: 4.w,
                                  bottom: 2.w,
                                  top: 1.w)),
                          '购买须知'.text().pd(null,
                              padding: EdgeInsets.only(left: 5.w, top: 2.w)),
                          Container(
                            padding: EdgeInsets.all(3.w),
                            width: 100.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.w),
                                border: Border.all(color: Colors.grey),
                                color: Colors.white),
                            child:
                                '“极市”的每件单品均采用区块链技术来进行溯源、防伪和保证唯一性，每件都独一无二且无法复制，商品图片仅供参考，产品以实物为准'
                                    .text(size: 3.5.w, weight: FontWeight.bold),
                          ).pd(null,
                              padding: EdgeInsets.only(
                                  left: 4.w,
                                  right: 4.w,
                                  bottom: 2.w,
                                  top: 1.w)),
                          SizedBox(height: 10.h)
                        ],
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 9.w, left: 2.w),
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            width: 10.w,
                            height: 10.w,
                            child: CupertinoNavigationBarBackButton(
                              color: 1.color,
                              onPressed: () {
                                setState(() {
                                  enableHero = true;
                                });
                                Get.back();
                              },
                            ),
                          ),
                        ),
                      ),
                      Align(
                        child: Padding(
                          padding: EdgeInsets.only(top: 85.h),
                          child: MaterialButton(
                            enableFeedback: false,
                            onPressed: (data.stock ?? 0) == 0
                                ? null
                                : () async {
                                    Get.to(() =>
                                        SubMarketPage(ancestorDetail: data));
                                    // await showModalBottomSheet(
                                    //     context: context,
                                    //     builder: (context) {
                                    //       return BuyBottomSheet(
                                    //         productName: data.name,
                                    //         shopName: data.resume,
                                    //         salePrice: data.price,
                                    //       );
                                    //     });
                                  },
                            minWidth: 85.w,
                            height: 7.h,
                            highlightElevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.w)),
                            color: 1.color,
                            textColor: 2.color,
                            disabledColor: Colors.grey,
                            disabledTextColor: 2.color,
                            child: ((data.stock ?? 0) == 0
                                    ? '已售罄'
                                    : '￥${(data.price ?? 999).price}')
                                .text(size: 4.w),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return const Scaffold(
                  body: Center(
                    child: CupertinoActivityIndicator(),
                  ),
                );
              }
            }),
      ),
    );
  }
}
