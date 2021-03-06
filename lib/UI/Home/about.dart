import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class AboutWebview extends StatefulWidget {
  _AboutWebviewState createState() => _AboutWebviewState();
}

class _AboutWebviewState extends State<AboutWebview> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
    return WebviewScaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("About"),
        centerTitle: true,
      ),
      url: "https://ivari.ca/about-us/corporate-information/",
    );
  }
}
