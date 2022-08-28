import 'package:flutter/material.dart';
import 'package:geekshop/models/commodity_detail_entity.dart';
import 'package:geekshop/models/sub_commodity_entity.dart';
import 'package:geekshop/pages/pay_page.dart';
import 'package:geekshop/utils/extend.dart';
import 'package:geekshop/utils/toast.dart';
import 'package:geekshop/widgets/image_slider.dart';
import 'package:get/get.dart';

class ConfirmPage extends StatefulWidget {
  const ConfirmPage({
    Key? key,
    required this.detail,
    required this.ancestorDetail,
  }) : super(key: key);
  final SubCommodityRows detail;
  final CommodityDetailData ancestorDetail;

  @override
  ConfirmPageState createState() => ConfirmPageState();
}

class ConfirmPageState extends State<ConfirmPage> {
  bool confirmPolicy = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: BottomAppBar(
        elevation: 0,
        child: Container(
          width: 100.w,
          height: 7.h,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.grey)),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 7.h,
                  color: Colors.white,
                  child: '￥${widget.detail.price!.price}'
                      .text(size: 5.w)
                      .pd(null, padding: EdgeInsets.only(left: 5.w)),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  alignment: Alignment.center,
                  height: 7.h,
                  color: Colors.teal,
                  child: '立即支付'.text(color: Colors.white, size: 4.w),
                ).tap(() {
                  if (confirmPolicy) {
                    Get.to(() => PayPage(
                          confirmID: widget.detail.id!,
                        ));
                  } else {
                    showToast('请同意服务协议');
                  }
                  ;
                }),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: '确认订单'.text(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ImageSlider(
            fit: BoxFit.cover,
            images: [NetworkImage(widget.detail.remark!)],
            width: 90.w,
            height: 40.h,
          ),
          Container(
            width: 90.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.w),
                border: Border.all(color: Colors.grey)),
            child: Column(
              children: [
                ListTile(
                  title: '作品名'.text(),
                  dense: true,
                  trailing: widget.ancestorDetail.name!.text(),
                ),
                ListTile(
                  title: '编号'.text(),
                  dense: true,
                  trailing: widget.detail.id!.text(),
                ),
                ListTile(
                  title: '创作者'.text(),
                  dense: true,
                  trailing: '创作者${widget.ancestorDetail.creatorId}'.text(),
                ),
                ListTile(
                  title: '区块链'.text(),
                  dense: true,
                  trailing: widget.detail.blockchainAddress!.text(),
                ),
                ListTile(
                  title: '合约地址'.text(),
                  dense: true,
                  trailing: '0x0000000'.text(),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Checkbox(
                  fillColor: MaterialStateProperty.all(Colors.grey),
                  value: confirmPolicy,
                  onChanged: (s) {
                    setState(() {
                      confirmPolicy = !confirmPolicy;
                    });
                  }),
              '我已阅读并同意极市'.text(),
              '《服务协议》'.text(color: Colors.blue).tap(() => null),
            ],
          ).pd(null, padding: EdgeInsets.only(left: 3.w))
        ],
      ).pd(
        null,
        padding: EdgeInsets.only(bottom: 10.h),
      ),
    );
  }
}
