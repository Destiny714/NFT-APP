import 'dart:io';

import 'package:flutter/material.dart';
import '../utils/extend.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWrapper extends StatefulWidget {
  const WebViewWrapper({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  WebViewWrapperState createState() => WebViewWrapperState();
}

class WebViewWrapperState extends State<WebViewWrapper> {
  WebViewController? _controller;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            splashRadius: 3.w,
              onPressed: () => _controller?.goBack(),
              icon: const Icon(Icons.fast_rewind_outlined)),
          IconButton(
            splashRadius: 3.w,
              onPressed: () => _controller?.goForward(),
              icon: const Icon(Icons.fast_forward_outlined)),
        ],
      ),
      body: WebView(
        onWebViewCreated: (controller) {
          _controller = controller;
        },
        backgroundColor: Colors.black12,
        userAgent:
            'Mozilla/5.0 (iPhone; CPU iPhone OS 11_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E217 MicroMessenger/6.8.0(0x16080000) NetType/WIFI Language/en Branch/Br_trunk MiniProgramEnv/Mac',
        gestureNavigationEnabled: true,
        zoomEnabled: false,
        initialUrl: widget.url,
      ),
    );
  }
}
