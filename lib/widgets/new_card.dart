import 'package:flutter/material.dart';
import 'package:geekshop/models/commodity_detail_entity.dart';
import 'package:geekshop/models/commodity_list_entity.dart';
import 'package:geekshop/network/apis.dart';
import 'package:get/get.dart';
import '../pages/sub_market_page.dart';
import '../utils/extend.dart';
import 'package:share_plus/share_plus.dart';

import '../pages/detail_page.dart';

class NewCard extends StatefulWidget {
  const NewCard({Key? key, required this.detail}) : super(key: key);
  final CommodityListRows detail;

  @override
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  bool like = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.w, left: 3.w, right: 3.w),
      child: GestureDetector(
        onTap: () {
          Get.to(() => DetailPage(id: widget.detail.id!, suffix: 'new'));
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.w)),
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(3.w)),
            height: 55.h,
            width: double.infinity,
            padding: EdgeInsets.all(2.w),
            child: Stack(
              children: [
                Center(
                  child: Hero(
                    tag: 'new-${widget.detail.id}',
                    child: Image.network(
                      widget.detail.cover!,
                      width: 100.w,
                      height: 35.h,
                      fit: BoxFit.cover,
                      cacheWidth: 100.w ~/ 1,
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 10.w,
                          height: 3.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(1.w),
                              bottomLeft: Radius.circular(1.w),
                            ),
                            color: Colors.greenAccent,
                          ),
                          child: '限量'.text(color: 1.color),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 20.w,
                          height: 3.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(1.w),
                              bottomRight: Radius.circular(1.w),
                            ),
                            color: Colors.black12,
                          ),
                          child: '${widget.detail.stock ?? 0}份'.text(),
                        )
                      ],
                    )),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      (widget.detail.resume ?? '')
                          .text(size: 4.w, weight: FontWeight.bold),
                      (widget.detail.name ?? '').text(
                          size: 7.w, weight: FontWeight.bold, maxLines: 1),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Share.share('url');
                        },
                        icon: const Icon(Icons.share_outlined),
                        padding: EdgeInsets.zero,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() => like = !like);
                        },
                        icon: like
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(Icons.favorite_border),
                        padding: EdgeInsets.zero,
                      ),
                      const Spacer(flex: 20),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: MaterialButton(
                    disabledColor: Colors.black12,
                    disabledTextColor: Colors.black45,
                    splashColor: Colors.grey,
                    highlightColor: Colors.grey,
                    elevation: 0,
                    color: Colors.black,
                    textColor: Colors.white,
                    minWidth: 3.w,
                    height: 5.h,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.w)),
                    onPressed: (widget.detail.stock ?? 0) == 0
                        ? null
                        : () async {
                            CommodityDetailData? detail =
                                await getCommodityDetail(widget.detail.id!);
                            Get.to(
                                () => SubMarketPage(ancestorDetail: detail!));
                            // await showModalBottomSheet(
                            //     context: context,
                            //     builder: (context) {
                            //       return BuyBottomSheet(
                            //         productName: widget.detail.name,
                            //         shopName: widget.detail.resume,
                            //         salePrice: widget.detail.price,
                            //       );
                            //     });
                          },
                    child: ((widget.detail.stock ?? 0) == 0
                            ? '已售罄'
                            : '￥${widget.detail.price?.price ?? 999}')
                        .text(size: 4.w),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
