import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class help extends StatefulWidget {
  _helpState createState() => _helpState();
}

class _helpState extends State<help> {
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
