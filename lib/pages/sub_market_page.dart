import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geekshop/network/apis.dart';
import 'package:geekshop/utils/extend.dart';
import 'package:geekshop/widgets/on_sell_refresh_list.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../models/commodity_detail_entity.dart';
import '../models/sub_commodity_entity.dart';

class SubMarketPage extends StatefulWidget {
  const SubMarketPage({
    Key? key,
    required this.ancestorDetail,
  }) : super(key: key);
  final CommodityDetailData ancestorDetail;

  @override
  SubMarketPageState createState() => SubMarketPageState();
}

class SubMarketPageState extends State<SubMarketPage> {
  List<SubCommodityRows> data = [];
  final AsyncMemoizer _memoizer = AsyncMemoizer();
  String? searchValue;
  FocusNode focusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();

  Future refreshData() async {
    await getSubCommodityList(widget.ancestorDetail.id!)
        .then((value) => data = value!);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _memoizer.runOnce(() async => await refreshData()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return KeyboardDismisser(
              child: Scaffold(
                appBar: AppBar(
                  elevation: 1,
                  backgroundColor: Colors.white70,
                  foregroundColor: Colors.black,
                  title: widget.ancestorDetail.name!.text(),
                  bottom: PreferredSize(
                    preferredSize: Size(100.w, 6.h),
                    child: Row(
                      children: [
                        const Spacer(flex: 1),
                        Container(
                          padding: EdgeInsets.only(left: 3.w),
                          width: 75.w,
                          height: 5.65.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.w),
                            border: Border.all(color: Colors.grey),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 63.w,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 0.5.w,
                                    ),
                                    TextField(
                                      enabled: true,
                                      controller: textEditingController,
                                      cursorColor: Colors.black12,
                                      onChanged: (s) {},
                                      onEditingComplete: () {
                                        focusNode.unfocus();
                                      },
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                      decoration: const InputDecoration(
                                          hintText: '输入编号搜索',
                                          border: InputBorder.none),
                                      focusNode: focusNode,
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              signed: true),
                                      style: TextStyle(fontSize: 4.w),
                                    )
                                  ],
                                ),
                              ),
                              searchValue != null
                                  ? Container(
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black26),
                                      width: 4.w,
                                      height: 4.w,
                                      child: Icon(Icons.close, size: 3.w),
                                    ).tap(() {
                                      textEditingController.clear();
                                      focusNode.unfocus();
                                    })
                                  : Container(),
                            ],
                          ),
                        ).pd(3.w),
                        const Spacer(flex: 1),
                        '搜索'.text(),
                        const Spacer(flex: 2),
                      ],
                    ),
                  ),
                ),
                body: OnSellRefreshList(detail: widget.ancestorDetail)
                    .pd(null, padding: EdgeInsets.only(top: 1.h)),
              ),
            );
          } else {
            return const CupertinoActivityIndicator();
          }
        });
  }
}
