import 'package:flutter/material.dart';
import 'package:geekshop/network/apis.dart';
import 'package:geekshop/utils/extend.dart';
import 'package:geekshop/utils/toast.dart';

class PayPage extends StatefulWidget {
  const PayPage({Key? key, required this.confirmID}) : super(key: key);
  final int confirmID;

  @override
  PayPageState createState() => PayPageState();
}

class PayPageState extends State<PayPage> {
  bool alipay = true;
  bool wechat = false;
  bool visa = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MaterialButton(
        disabledColor: Colors.black12,
        disabledTextColor: Colors.black45,
        splashColor: Colors.grey,
        highlightColor: Colors.transparent,
        highlightElevation: 0,
        elevation: 0,
        color: Colors.black,
        textColor: Colors.white,
        minWidth: 90.w,
        height: 7.h,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.w)),
        child: '立即支付'.text(size: 4.w),
        onPressed: () async {
          await createOrder(widget.confirmID).then((value){
            if (value == null) {
              showToast('创建成功');
            }else{
              showToast(value);
            }
          });
        },
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: '选择支付方式'.text(),
      ),
      body: ListView(
        children: [
          Card(
            child: CheckboxListTile(
              activeColor: Colors.black38,
              title: '支付宝'.text(),
              onChanged: (bool? value) {
                setState(() {
                  alipay = !alipay;
                  if (alipay) {
                    wechat = false;
                    visa = false;
                  }
                });
              },
              value: alipay,
            ),
          ),
          Card(
            child: CheckboxListTile(
              activeColor: Colors.black38,
              title: '微信'.text(),
              onChanged: (bool? value) {
                setState(() {
                  wechat = !wechat;
                  if (wechat) {
                    alipay = false;
                    visa = false;
                  }
                });
              },
              value: wechat,
            ),
          ),
          Card(
            child: CheckboxListTile(
              activeColor: Colors.black38,
              title: '银联'.text(),
              onChanged: (bool? value) {
                setState(() {
                  visa = !visa;
                  if (visa) {
                    wechat = false;
                    alipay = false;
                  }
                });
              },
              value: visa,
            ),
          ),
        ],
      ),
    );
  }
}
