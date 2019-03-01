import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

/// TODO: dead code
class DetailPostingScreen extends StatelessWidget {
  var post;
  DetailPostingScreen({Key key, @required var this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post['title']['rendered']),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: post["featured_media"] == 0
                  ? 'images/placeholder.png'
                  : post["_embedded"]["wp:featuredmedia"][0]["source_url"],
            ),
            Text(post['content']['rendered'].replaceAll(RegExp(r'<[^>]*>'), ''))
          ],
        ),
      ),
    );
  }
}
