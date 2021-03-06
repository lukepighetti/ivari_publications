import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatItemScreen extends StatefulWidget {
  @override
  _ChatItemScreenState createState() => _ChatItemScreenState();
}

/// defaultUserName use in a Chat name
const String defaultUserName = "Alisa Hearth";

class _ChatItemScreenState extends State<ChatItemScreen>
    with TickerProviderStateMixin {
  final List<Msg> _messages = <Msg>[];
  final TextEditingController _textController = TextEditingController();
  bool _isWriting = false;

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        title: Text(
          "Chatting",
          style: TextStyle(
              fontFamily: "Gotik", fontSize: 18.0, color: Colors.black54),
        ),
        iconTheme: IconThemeData(color: Color(0xFF6991C7)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),

      /// body in chat like a list in a message
      body: Container(
        color: Colors.white,
        child: Column(children: <Widget>[
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

          /// Line
          Divider(height: 1.5),
          Container(
            child: _buildComposer(),
            decoration: BoxDecoration(
                color: Theme.of(ctx).cardColor,
                boxShadow: [BoxShadow(blurRadius: 1.0, color: Colors.black12)]),
          ),
        ]),
      ),
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
              Icon(
                Icons.add,
                color: Colors.blueAccent,
                size: 27.0,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(00.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(1.0),
                            bottomLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            topLeft: Radius.circular(20.0)),
                        color: Color(0xFF6991C7).withOpacity(0.6),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        txt,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
//            new Container(
//              margin: const EdgeInsets.only(right: 5.0,left: 10.0),
//              child: new CircleAvatar(
//                backgroundImage: AssetImage("assets/avatars/avatar-1.jpg"),
////                  backgroundColor: Colors.indigoAccent,
////                  child: new Text(defaultUserName[0])),
//              ),
//            ),
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
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Center(
              child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    "assets/imgIllustration/IlustrasiMessage.png",
                    height: 220.0,
                  )),
            ),
          ),
          Center(
              child: Text(
            "Not Have Message",
            style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.black12,
                fontSize: 17.0,
                fontFamily: "Popins"),
          ))
        ],
      ),
    ));
  }
}
