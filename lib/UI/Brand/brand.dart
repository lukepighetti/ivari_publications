import 'package:flutter/material.dart';
import 'package:info_apps_flutter/ListItem/BrandDataList.dart';
import 'package:info_apps_flutter/UI/Brand/BrandDetail.dart';
import 'package:info_apps_flutter/UI/Brand/Search.dart';

class BrandScreen extends StatefulWidget {
  @override
  _BrandScreenState createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {
  @override
  Widget build(BuildContext context) {
    /// Component appbar
    var _appbar = AppBar(
      backgroundColor: Color(0xFFFFFFFF),
      elevation: 0.0,
      title: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Text(
          "Categories",
          style: TextStyle(
              fontFamily: "Gotik",
              fontSize: 20.0,
              color: Colors.black54,
              fontWeight: FontWeight.w700),
        ),
      ),
      actions: <Widget>[
        InkWell(
          onTap: () {
            Navigator.of(context).push(
                PageRouteBuilder(pageBuilder: (_, __, ___) => searchAppbar()));
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.search,
              size: 27.0,
              color: Colors.black54,
            ),
          ),
        )
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Scaffold(

          /// Calling variable appbar
          appBar: _appbar,
          body: Container(
            color: Colors.white,
            child: CustomScrollView(
              /// Create List Menu
              slivers: <Widget>[
                SliverPadding(
                  padding: EdgeInsets.only(top: 0.0),
                  sliver: SliverFixedExtentList(
                      itemExtent: 145.0,
                      delegate: SliverChildBuilderDelegate(

                          /// Calling itemCard Class for constructor card
                          (context, index) => ItemCard(brandData[index]),
                          childCount: brandData.length)),
                ),
              ],
            ),
          )),
    );
  }
}

/// Constructor for itemCard for List Menu
class ItemCard extends StatelessWidget {
  /// Declaration and Get data from BrandDataList.dart
  final Brand brand;
  ItemCard(this.brand);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
                pageBuilder: (_, __, ___) => BrandDetail(brand),
                transitionDuration: Duration(milliseconds: 600),
                transitionsBuilder:
                    (_, Animation<double> animation, __, Widget child) {
                  return Opacity(
                    opacity: animation.value,
                    child: child,
                  );
                }),
          );
        },
        child: Container(
          height: 130.0,
          width: 400.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          child: Hero(
            tag: 'hero-tag-${brand.id}',
            child: Material(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  image: DecorationImage(
                      image: AssetImage(brand.img), fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFABABAB).withOpacity(0.3),
                      blurRadius: 1.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Colors.black12.withOpacity(0.1),
                  ),
                  child: Center(
                    child: Text(
                      brand.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Berlin",
                        fontSize: 35.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
