import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailsWebPage extends StatelessWidget {
  final dynamic news;
  const DetailsWebPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(news.url));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          news.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
