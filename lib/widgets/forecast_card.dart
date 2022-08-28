import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/commodity_list_entity.dart';
import '../utils/extend.dart';
import '../pages/detail_page.dart';
import 'buy_bottom_sheet.dart';

class ForecastCard extends StatefulWidget {
  const ForecastCard({Key? key, required this.detail}) : super(key: key);
  final CommodityListRows detail;

  @override
  State<ForecastCard> createState() => _ForecastCardState();
}

class _ForecastCardState extends State<ForecastCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.w),
      child: GestureDetector(
        onTap: () {
          Get.to(() => DetailPage(id: widget.detail.id!,suffix: 'forecast'));
        },
        child: Container(
          color: Colors.white,
          height: 30.h,
          width: double.infinity,
          padding: EdgeInsets.all(2.w),
          child: Stack(
            children: [
              Center(
                child: Hero(
                  tag: 'forecast-${widget.detail.id}',
                  child: Image(
                    image: NetworkImage(widget.detail.remark ?? ''),
                    height: 20.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      (widget.detail.name ?? '').text(
                          size: 4.w, weight: FontWeight.bold, maxLines: 1),
                      '预计 今天 11:00'.text(color: Colors.grey),
                      '36 - 46'.text(color: Colors.grey),
                    ],
                  )),
              Align(
                alignment: Alignment.bottomLeft,
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
                  child: '￥${widget.detail.price?.toInt() ?? 999}'
                      .text(size: 4.w),
                  onPressed: () async {
                    await showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return BuyBottomSheet(
                            productName: widget.detail.name,
                            shopName: widget.detail.resume,
                            salePrice: widget.detail.price,
                          );
                        });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
