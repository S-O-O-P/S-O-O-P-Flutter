import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewScreen extends StatelessWidget {
  final String url;

  const WebViewScreen({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('웹 페이지'),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(url)),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            useShouldOverrideUrlLoading: true,
            mediaPlaybackRequiresUserGesture: false,
          ),
        ),
        onWebViewCreated: (InAppWebViewController controller) {
          // 웹뷰가 생성되었을 때의 콜백
        },
        onLoadStart: (InAppWebViewController controller, Uri? url) {
          // 페이지 로딩이 시작될 때의 콜백
        },
        onLoadStop: (InAppWebViewController controller, Uri? url) {
          // 페이지 로딩이 완료되었을 때의 콜백
        },
      ),
    );
  }
}