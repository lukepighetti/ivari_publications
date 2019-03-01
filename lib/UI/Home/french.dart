import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class FrenchWebview extends StatefulWidget {
  _FrenchWebviewState createState() => _FrenchWebviewState();
}

class _FrenchWebviewState extends State<FrenchWebview> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
    return WebviewScaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("All Publications"),
        centerTitle: true,
      ),
      url: "https://bkgapp.ivari.ca/publications/",
    );
  }
}
