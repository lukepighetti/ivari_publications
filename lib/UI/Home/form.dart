import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class form extends StatefulWidget {
  _formState createState() => _formState();
}

class _formState extends State<form> {
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
