import 'package:flutter/material.dart';
import '../utils/extend.dart';

class BuyBottomSheet extends StatefulWidget {
  const BuyBottomSheet(
      {Key? key,
      this.productName,
      this.shopName,
      this.salePrice})
      : super(key: key);
  final String? productName;
  final String? shopName;
  final double? salePrice;

  @override
  State<BuyBottomSheet> createState() => _BuyBottomSheetState();
}

class _BuyBottomSheetState extends State<BuyBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: () {},
        builder: (context) {
          return SizedBox(
            height: 40.h,
            child: ListView(
              children: [
                ListTile(
                  title: Center(
                    child: widget.productName?.text(maxLines: 1, size: 5.w),
                  ),
                  subtitle: Center(
                    child: widget.shopName?.text(maxLines: 1),
                  ),
                ),
                const Divider(),
                ListTile(
                  title: '编号'.text(),
                  trailing: '#1'.text(),
                ),
                const Divider(),
                ListTile(
                  title: '价格'.text(),
                  trailing: '￥${widget.salePrice?.toInt()}'.text(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 8.w, left: 4.w, right: 4.w, bottom: 4.w),
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.w),
                    ),
                    height: 8.h,
                    child: '立即购买'.text(color: Colors.white, size: 4.w),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
