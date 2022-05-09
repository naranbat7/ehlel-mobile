import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QPayPage extends StatelessWidget {
  final String url;

  const QPayPage(this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("QPay төлбөр"), centerTitle: true),
      body: SafeArea(
        child: WebView(initialUrl: url),
      ),
    );
  }
}
