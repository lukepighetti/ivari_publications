import 'package:flutter/material.dart';
import 'package:info_apps_flutter/UI/Profile/AboutApps.dart';
import 'package:info_apps_flutter/UI/Profile/CallCenter.dart';
import 'package:info_apps_flutter/UI/Profile/CreditCardSetting.dart';
import 'package:info_apps_flutter/UI/Profile/Message.dart';
import 'package:info_apps_flutter/UI/Profile/MyOrders.dart';
import 'package:info_apps_flutter/UI/Profile/Notification.dart';
import 'package:info_apps_flutter/UI/Profile/SettingAcount.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

/// Custom Font
var _txt = TextStyle(
  color: Colors.black,
  fontFamily: "Sans",
);

/// Get _txt and custom value of Variable for Name User
var _txtName = _txt.copyWith(fontWeight: FontWeight.w700, fontSize: 17.0);

/// Get _txt and custom value of Variable for Edit text
var _txtEdit = _txt.copyWith(color: Colors.black26, fontSize: 15.0);

/// Get _txt and custom value of Variable for Category Text
var _txtCategory = _txt.copyWith(
    fontSize: 14.5, color: Colors.black54, fontWeight: FontWeight.w500);

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    /// To Sett PhotoProfile,Name and Edit Profile
    var _profile = Padding(
      padding: EdgeInsets.only(
        top: 185.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2.5),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/img/womanface.jpg"))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  "Alisa Heart",
                  style: _txtName,
                ),
              ),
              InkWell(
                onTap: null,
                child: Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Text(
                    "Edit Profile",
                    style: _txtEdit,
                  ),
                ),
              ),
            ],
          ),
          Container(),
        ],
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              /// Setting Header Banner
              Container(
                height: 240.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/img/headerProfile.png"),
                        fit: BoxFit.cover)),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 35.0, left: 15.0),
                child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
              ),

              /// Calling _profile variable
              _profile,
              Padding(
                padding: const EdgeInsets.only(top: 360.0),
                child: Column(
                  /// Setting Category List
                  children: <Widget>[
                    /// Call category class
                    Category(
                      txt: "Notification",
                      padding: 35.0,
                      image: "assets/icon/notification.png",
                      tap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder: (_, __, ___) => NotificationScreen()));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 85.0, right: 30.0),
                      child: Divider(
                        color: Colors.black12,
                        height: 2.0,
                      ),
                    ),
                    Category(
                      txt: "Payments",
                      padding: 35.0,
                      image: "assets/icon/creditAcount.png",
                      tap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>
                                CreditCardSettingScreen()));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 85.0, right: 30.0),
                      child: Divider(
                        color: Colors.black12,
                        height: 2.0,
                      ),
                    ),
                    Category(
                      txt: "Message",
                      padding: 26.0,
                      image: "assets/icon/chat.png",
                      tap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder: (_, __, ___) => ChatScreen()));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 85.0, right: 30.0),
                      child: Divider(
                        color: Colors.black12,
                        height: 2.0,
                      ),
                    ),
                    Category(
                      txt: "My Orders",
                      padding: 23.0,
                      image: "assets/icon/truck.png",
                      tap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder: (_, __, ___) => OrderScreen()));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 85.0, right: 30.0),
                      child: Divider(
                        color: Colors.black12,
                        height: 2.0,
                      ),
                    ),
                    Category(
                      txt: "Setting Acount",
                      padding: 30.0,
                      image: "assets/icon/setting.png",
                      tap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>
                                SettingAccountScreen()));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 85.0, right: 30.0),
                      child: Divider(
                        color: Colors.black12,
                        height: 2.0,
                      ),
                    ),
                    Category(
                      txt: "Call Center",
                      padding: 30.0,
                      image: "assets/icon/callcenter.png",
                      tap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder: (_, __, ___) => CallCenterScreen()));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 85.0, right: 30.0),
                      child: Divider(
                        color: Colors.black12,
                        height: 2.0,
                      ),
                    ),
                    Category(
                      padding: 38.0,
                      txt: "About Apps",
                      image: "assets/icon/aboutapp.png",
                      tap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder: (_, __, ___) => AboutAppsScreen()));
                      },
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 20.0)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Component category class to set list
class Category extends StatelessWidget {
  final String txt, image;
  final GestureTapCallback tap;
  final double padding;

  Category({this.txt, this.image, this.tap, this.padding});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 30.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: padding),
                  child: Image.asset(
                    image,
                    height: 25.0,
                  ),
                ),
                Text(
                  txt,
                  style: _txtCategory,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
