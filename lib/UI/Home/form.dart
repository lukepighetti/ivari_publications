import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class FormWebview extends StatefulWidget {
  _FormWebviewState createState() => _FormWebviewState();
}

class _FormWebviewState extends State<FormWebview> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
    return WebviewScaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Forms"),
        centerTitle: true,
      ),
      url: "https://ivari.ca/tools-and-resources/administration/",
    );
  }
}
