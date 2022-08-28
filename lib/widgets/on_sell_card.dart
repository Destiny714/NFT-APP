import 'package:flutter/material.dart';
import 'package:geekshop/models/commodity_detail_entity.dart';
import 'package:geekshop/models/sub_commodity_entity.dart';
import 'package:get/get.dart';

import '../models/commodity_list_entity.dart';
import '../pages/comfirm_page.dart';
import '../pages/detail_page.dart';
import '../utils/extend.dart';

class OnSellCard extends StatefulWidget {
  const OnSellCard({
    Key? key,
    required this.detail,
    required this.ancestorDetail,
  }) : super(key: key);
  final SubCommodityRows detail;
  final CommodityDetailData ancestorDetail;

  @override
  State<OnSellCard> createState() => _OnSellCardState();
}

class _OnSellCardState extends State<OnSellCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ConfirmPage(
              detail: widget.detail,
              ancestorDetail: widget.ancestorDetail,
            ));
      },
      child: Container(
        padding: EdgeInsets.zero,
        width: 30.w,
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 3,
              child: Image.network(
                widget.detail.cover!,
                height: 20.h,
                width: 30.w,
                fit: BoxFit.cover,
              ),
            ),
            Flexible(
              flex: 1,
              child: '${widget.detail.id!}/5000'.text().pd(1.w),
            ),
            Flexible(
              flex: 1,
              child: '￥${widget.detail.price!.price}'
                  .text()
                  .pd(null, padding: EdgeInsets.only(right: 2.w, bottom: 2.w)),
            ),
          ],
        ),
      ),
    ).pd(2.w);
  }
}
