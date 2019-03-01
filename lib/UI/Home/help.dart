import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class HelpWebview extends StatefulWidget {
  _HelpWebviewState createState() => _HelpWebviewState();
}

class _HelpWebviewState extends State<HelpWebview> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
    return WebviewScaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("webCappow"),
        centerTitle: true,
      ),
      url: "https://secure.ivari.ca/_forms/ezlogin.aspx/",
    );
  }
}
