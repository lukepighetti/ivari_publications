import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:info_apps_flutter/ListItem/BrandDataList.dart';

class privatemessage extends StatefulWidget {
  /// Declare Brand class and Get Data Name for Appbar (BrandDataList.dart)
  final Brand brand;
  privatemessage(this.brand);

  @override
  _privatemessageState createState() => _privatemessageState(brand);
}

/// Declare default User Name
const String defaultUserName = "Alisa Heart";

class _privatemessageState extends State<privatemessage>
    with TickerProviderStateMixin {
  final List<Msg> _messages = <Msg>[];
  final TextEditingController _textController = TextEditingController();
  bool _isWriting = false;

  /// Declare Brand class
  final Brand brand;
  _privatemessageState(this.brand);

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        title: Text(
          brand.name,
          style: TextStyle(
              fontFamily: "Gotik", fontSize: 18.0, color: Colors.black54),
        ),
        iconTheme: IconThemeData(color: Color(0xFF6991C7)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(children: <Widget>[
        Flexible(
          child: _messages.length > 0
              ? Container(
                  child: ListView.builder(
                    itemBuilder: (_, int index) => _messages[index],
                    itemCount: _messages.length,
                    reverse: true,
                    padding: EdgeInsets.all(10.0),
                  ),
                )
              : NoMessage(),
        ),
        Divider(height: 1.5),
        Container(
          child: _buildComposer(),
          decoration: BoxDecoration(
              color: Theme.of(ctx).cardColor,
              boxShadow: [BoxShadow(blurRadius: 1.0, color: Colors.black12)]),
        ),
      ]),
    );
  }

  /// Component for typing text
  Widget _buildComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 9.0),
          child: Row(
            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: TextField(
                    controller: _textController,
                    onChanged: (String txt) {
                      setState(() {
                        _isWriting = txt.length > 0;
                      });
                    },
                    onSubmitted: _submitMsg,
                    decoration: InputDecoration.collapsed(
                        hintText: "Enter some text to send a message",
                        hintStyle: TextStyle(
                            fontFamily: "Sans",
                            fontSize: 16.0,
                            color: Colors.black26)),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 3.0),
                  child: Theme.of(context).platform == TargetPlatform.iOS
                      ? CupertinoButton(
                          child: Text("Submit"),
                          onPressed: _isWriting
                              ? () => _submitMsg(_textController.text)
                              : null)
                      : IconButton(
                          icon: Icon(Icons.message),
                          onPressed: _isWriting
                              ? () => _submitMsg(_textController.text)
                              : null,
                        )),
            ],
          ),
          decoration: Theme.of(context).platform == TargetPlatform.iOS
              ? BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.brown)))
              : null),
    );
  }

  void _submitMsg(String txt) {
    _textController.clear();
    setState(() {
      _isWriting = false;
    });
    Msg msg = Msg(
      txt: txt,
      animationController: AnimationController(
          vsync: this, duration: Duration(milliseconds: 800)),
    );
    setState(() {
      _messages.insert(0, msg);
    });
    msg.animationController.forward();
  }

  @override
  void dispose() {
    for (Msg msg in _messages) {
      msg.animationController.dispose();
    }
    super.dispose();
  }
}

class Msg extends StatelessWidget {
  Msg({this.txt, this.animationController});

  final String txt;
  final AnimationController animationController;

  @override
  Widget build(BuildContext ctx) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(
          parent: animationController, curve: Curves.fastOutSlowIn),
      axisAlignment: 0.0,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 18.0),
              child: CircleAvatar(
                  backgroundColor: Colors.indigoAccent,
                  child: Text(defaultUserName[0])),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(defaultUserName,
                      style: TextStyle(
                          fontFamily: "Gotik", fontWeight: FontWeight.w900)),
                  Container(
                    margin: const EdgeInsets.only(top: 6.0),
                    child: Text(txt),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NoMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Opacity(
              opacity: 0.5,
              child: Image.asset(
                "assets/imgIllustration/IlustrasiMessage.png",
                height: 220.0,
              )),
          Text(
            "Not Have Message",
            style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.black12,
                fontSize: 17.0,
                fontFamily: "Popins"),
          )
        ],
      ),
    ));
  }
}
