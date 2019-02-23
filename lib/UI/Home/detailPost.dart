import 'package:flutter/material.dart';
import 'package:info_apps_flutter/ListItem/CategorySlider.dart';
import 'package:info_apps_flutter/UI/Home/home.dart';
import 'package:transparent_image/transparent_image.dart';

class detailPost extends StatelessWidget {

  var post;
    detailPost({Key key, @required var this.post}) : super(key:key);

  @override

  Widget build(BuildContext context) {
   return Scaffold(
          body: SingleChildScrollView(
         child: Column(
         children:<Widget>[
            Stack(
            children: <Widget>[
              Image.network("https://pilbox.themuse.com/image.jpg?url=https%3A%2F%2Fassets.themuse.com%2Fuploaded%2Fattachments%2F24087.jpg%3Fv%3D34479919557aa0a653a5cee75ab3426df6866f1b395d6e87562cf27332b682b4&h=367&prog=1",height: 250.0,width: double.infinity,fit: BoxFit.cover,),
                Padding(
                  padding: const EdgeInsets.only(top:45.0,left: 20.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).pushReplacement(PageRouteBuilder(pageBuilder: (_,__,___)=> new home()));
                    },
                    child: Icon(Icons.arrow_back,color: Colors.black,)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:190.0,left: 25.0),
                  child: Container(
                      child: Container(
                height: 150.0,
                width: 115.0,
                child:     new FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: post["featured_media"] == 0
                  ? 'images/placeholder.png'
                  : post["_embedded"]["wp:featuredmedia"][0]["source_url"],
            ),
              ),
              ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 290.0,left: 160.0),
                  child: Text(post['title']['rendered'],style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.w600),)),
            ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:35.0,left: 25.0,right: 25.0),
              child: Column(
                children: <Widget>[
                     new Text(post['content']['rendered'].replaceAll(new RegExp(r'<[^>]*>'), ''))
                  ]),
            ),
         ]
      ),
          ),
    );
  }
}
