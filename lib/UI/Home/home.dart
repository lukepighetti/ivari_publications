import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:transparent_image/transparent_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:info_apps_flutter/ListItem/CategorySlider.dart';
import 'package:info_apps_flutter/UI/Brand/brand.dart';
import 'package:info_apps_flutter/UI/Home/about.dart';
import 'package:info_apps_flutter/UI/Home/detailpost.dart';
import 'package:info_apps_flutter/UI/Home/form.dart';
import 'package:info_apps_flutter/UI/Home/help.dart';
import 'package:info_apps_flutter/UI/Profile/profile.dart';
import 'package:info_apps_flutter/UI/Home/french.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/foundation.dart';

//  String urlApi = "https://saiberart.com/pub/wp-json/wp/v2/posts";

String urlApi = "https://saiberart.com/pub/wp-json/wp/v2/";

List<ItemSlider> parseitemSlider(String responeBody) {
  final parse = json.decode(responeBody).cast<Map<String, dynamic>>();
  return parse.map<ItemSlider>((json) => ItemSlider.fromJson(json)).toList();
}

Future<List<ItemSlider>> fetchitemSliders(http.Client client) async {
  final respone = await client.get(urlApi);
  return compute(parseitemSlider, respone.body);
}

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// To set duration initState auto start if FlashSale Layout open
  List posts;

  List<ItemSlider> item;

  // Base URL for our wordpress API
  final String apiUrl = "https://saiberart.com/pub/wp-json/wp/v2/";

  // Function to fetch list of posts
  Future<String> getPosts() async {
    var res = await http.get(Uri.encodeFull(apiUrl + "posts?_embed"),
        headers: {"Accept": "application/json"});

    // fill our posts list with results and update state
    setState(() {
      var resBody = json.decode(res.body);
      posts = resBody;
    });

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    /// Navigation to MenuDetail.dart if user Click icon in category Menu like a example camera
    // var onClickMenuIcon = () {
    // Navigator.of(context).push(PageRouteBuilder(
    //     pageBuilder: (_, __, ___) => new menuDetail(),
    //     transitionDuration: Duration(milliseconds: 750),
    //     /// Set animation with opacity
    //     transitionsBuilder:
    //         (_, Animation<double> animation, __, Widget child) {
    //       return Opacity(
    //         opacity: animation.value,
    //         child: child,
    //       );
    //     }));
    // };

    /// ImageSlider in header
    var imageSlider = Container(
      height: 182.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        dotColor: Color(0xFF6991C7).withOpacity(0.8),
        dotSize: 5.5,
        dotSpacing: 16.0,
        dotBgColor: Colors.transparent,
        showIndicator: true,
        overlayShadow: true,
        overlayShadowColors: Colors.white.withOpacity(0.9),
        overlayShadowSize: 0.9,
        images: [
          AssetImage("assets/img/baner1.png"),
          AssetImage("assets/img/baner12.png"),
          AssetImage("assets/img/baner2.png"),
          AssetImage("assets/img/baner3.png"),
          AssetImage("assets/img/baner4.png"),
        ],
      ),
    );

    /// CategoryIcon Component
    var categoryIcon = Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 20.0),
      alignment: AlignmentDirectional.centerStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 0.0),
            child: Text(
              "You will fine all the publications here.",
              style: TextStyle(
                  fontSize: 13.5,
                  fontFamily: "Sans",
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 30.0))
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF0074A2),
        title: Text("ivari Publications",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Popins",
                fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/menu_background.jpg"),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Text("Favories",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Gotik",
                        fontSize: 21.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w500)),
                //_line(),
                SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (_, __, ___) => FormWebview()));
                  },
                  child: Text("Forms",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Gotik",
                          fontSize: 21.0,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w500)),
                ),
                // _line(),
                SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (_, __, ___) => BrandScreen()));
                  },
                  child: Text("Categorie Brand",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Gotik",
                          fontSize: 21.0,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w500)),
                ),
                //_line(),
                SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (_, __, ___) => HelpWebview()));
                  },
                  child: Text("webCappow",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Gotik",
                          fontSize: 21.0,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w500)),
                ),
                // _line(),
                SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (_, __, ___) => AboutWebview()));
                  },
                  child: Text("About",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Gotik",
                          fontSize: 21.0,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w500)),
                ),
                // _line(),
                SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (_, __, ___) => profil()));
                  },
                  child: Text("Profile",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Gotik",
                          fontSize: 21.0,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w500)),
                ),
                //_line(),
                SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (_, __, ___) => FrenchWebview()));
                  },
                  child: Text("French",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Gotik",
                          fontSize: 21.0,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w500)),
                ),
                //_line(),
              ],
            ),
          ),
        ),
      ),

      /// Use Stack to costume a appbar
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /// Call var imageSlider
            imageSlider,

            /// Call var categoryIcon
            categoryIcon,

            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10),
              child: Text(
                "All Publications",
                style: TextStyle(
                    fontSize: 13.5,
                    fontFamily: "Sans",
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 15.0),
              child: Container(
                height: 200.0,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: posts == null ? 0 : posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>
                                DetailPostScreen(post: posts[index])));
                      },
                      child: Container(
                        width: 110.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 150.0,
                              width: 100.0,
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: posts[index]["featured_media"] == null
                                    ? Container()
                                    : posts[index]["_embedded"]
                                        ["wp:featuredmedia"][0]["source_url"],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Text(posts[index]["title"]["rendered"]),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10.0),
              child: Text(
                "French Publications",
                style: TextStyle(
                    fontSize: 13.5,
                    fontFamily: "Sans",
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 15.0),
              child: Container(
                height: 200.0,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: posts == null ? 0 : posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>
                                DetailPostScreen(post: posts[index])));
                      },
                      child: Container(
                        width: 110.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 150.0,
                              width: 100.0,
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: posts[index]["featured_media"] == null
                                    ? Container()
                                    : posts[index]["_embedded"]
                                        ["wp:featuredmedia"][0]["source_url"],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Text(posts[index]["title"]["rendered"]),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10),
              child: Text(
                "New Second",
                style: TextStyle(
                    fontSize: 13.5,
                    fontFamily: "Sans",
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 15.0),
              child: Container(
                height: 200.0,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: posts == null ? 0 : posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>
                                DetailPostScreen(post: posts[index])));
                      },
                      child: Container(
                        width: 110.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 150.0,
                              width: 100.0,
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: posts[index]["featured_media"] == null
                                    ? Container()
                                    : posts[index]["_embedded"]
                                        ["wp:featuredmedia"][0]["source_url"],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              //child: Text(posts[index]["title"]["rendered"]),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Component item Menu icon bellow a ImageSlider
class CategoryIconValue extends StatelessWidget {
  final String icon1, icon2, icon3, icon4, title1, title2, title3, title4;
  final GestureTapCallback tap1, tap2, tap3, tap4;

  CategoryIconValue(
      {this.icon1,
      this.tap1,
      this.icon2,
      this.tap2,
      this.icon3,
      this.tap3,
      this.icon4,
      this.tap4,
      this.title1,
      this.title2,
      this.title3,
      this.title4});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: tap1,
          child: Column(
            children: <Widget>[
              Image.asset(
                icon1,
                height: 19.2,
              ),
              Padding(padding: EdgeInsets.only(top: 7.0)),
              Text(
                title1,
                style: TextStyle(
                  fontFamily: "Sans",
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        InkWell(
          onTap: tap2,
          child: Column(
            children: <Widget>[
              Image.asset(
                icon2,
                height: 26.2,
              ),
              Padding(padding: EdgeInsets.only(top: 0.0)),
              Text(
                title2,
                style: TextStyle(
                  fontFamily: "Sans",
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        InkWell(
          onTap: tap3,
          child: Column(
            children: <Widget>[
              Image.asset(
                icon3,
                height: 22.2,
              ),
              Padding(padding: EdgeInsets.only(top: 4.0)),
              Text(
                title3,
                style: TextStyle(
                  fontFamily: "Sans",
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        InkWell(
          onTap: tap4,
          child: Column(
            children: <Widget>[
              Image.asset(
                icon4,
                height: 19.2,
              ),
              Padding(padding: EdgeInsets.only(top: 7.0)),
              Text(
                title4,
                style: TextStyle(
                  fontFamily: "Sans",
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryPublisher extends StatelessWidget {
  final List<ItemSlider> item;

  CategoryPublisher({this.item});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: item.length,
      itemBuilder: (ctx, i) {
        return Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Container(
            height: 100.0,
            width: 50.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Container(
                    height: 100.0,
                    width: 50.0,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_,__,___)=> detailPost(item[i])));
                      },
                      //             child: Container(
                      //   height: 150.0,
                      //   width: 115.0,
                      //   child: Material(
                      //     child: DecoratedBox(
                      //   decoration: BoxDecoration(
                      //   image: DecorationImage(
                      //       image: AssetImage('${item[i].img}'), fit: BoxFit.cover),
                      //    boxShadow: [
                      //     BoxShadow(
                      //       color: Color(0xFFABABAB).withOpacity(0.3),
                      //       blurRadius: 1.0,
                      //       spreadRadius: 2.0,
                      //     ),
                      //   ],
                      //   ),
                      //     ),
                      //   ),
                      // ),
                    ),
                  ),
                ),
                Container(
                    height: 100.0,
                    child: Text(
                      '${item[i].title}',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
