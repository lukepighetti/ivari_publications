import 'dart:async';

import 'package:flutter/material.dart';
import 'package:info_apps_flutter/UI/LoginOrSignup/Login.dart';
import 'package:info_apps_flutter/UI/LoginOrSignup/LoginAnimation.dart';
import 'package:info_apps_flutter/UI/LoginOrSignup/Signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  //Animation Declaration

  /// Component Widget layout UI
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    mediaQueryData.devicePixelRatio;
    mediaQueryData.size.height;
    mediaQueryData.size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            /// Set Background image in layout
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/img/backgroundgirl.png"),
              fit: BoxFit.cover,
            )),
            child: Container(
              /// Set gradient color in image
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(0, 0, 0, 0.2),
                    Color.fromRGBO(0, 0, 0, 0.3)
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                ),
              ),

              /// Set component layout
              child: Form(
                child: ListView(
                  padding: EdgeInsets.all(0.0),
                  children: <Widget>[
                    Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              alignment: AlignmentDirectional.topCenter,
                              child: SignUpColumn(
                                mediaQueryData: mediaQueryData,
                              ),
                            )
                          ],
                        ),

                        /// Set Animation after user click Signup Button
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignUpColumn extends StatefulWidget {
  SignUpColumn({
    Key key,
    @required this.mediaQueryData,
  }) : super(key: key);

  final MediaQueryData mediaQueryData;

  @override
  _SignUpColumnState createState() => _SignUpColumnState();
}

class _SignUpColumnState extends State<SignUpColumn>
    with TickerProviderStateMixin {
  final firebaseAuth = FirebaseAuth.instance;
//  final googleSignIn = GoogleSignIn();
  final facebookSignIn = FacebookAuthProvider();

  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  String _advisorType;

  String get _firstName => _firstNameController.text;

  String get _lastName => _lastNameController.text;

  String get _email => _emailController.text;

  String get password => _passwordController.text;

  String get _phoneNumber => _phoneNumberController.text;

  String get _address => _addressController.text;
  AnimationController sanimationController;
  AnimationController animationControllerScreen;
  Animation animationScreen;
  var tap = 0;

  /// Set AnimationController to initState
  @override
  void initState() {
    sanimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800))
          ..addStatusListener((statuss) {
            if (statuss == AnimationStatus.dismissed) {
              setState(() {
                tap = 0;
              });
            }
          });
    // TODO: implement initState
    super.initState();
  }

  /// Dispose animationController
  @override
  void dispose() {
    super.dispose();
    sanimationController.dispose();
  }

  /// Playanimation set forward reverse
  Future<Null> _PlayAnimation() async {
    try {
      await sanimationController.forward();
      await sanimationController.reverse();
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        /// padding logo
        Padding(
            padding:
                EdgeInsets.only(top: widget.mediaQueryData.padding.top + 40.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage("assets/img/Logo.png"),
              height: 70.0,
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),

            /// Animation text treva shop accept from login layout
            Hero(
              tag: "Treva",
              child: Text(
                "Treva Shop",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.6,
                    fontFamily: "Sans",
                    color: Colors.white,
                    fontSize: 20.0),
              ),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 30.0)),

        ///AuthButtons Section

        MaterialButton(
            child: Text("Sign in with Google"),
            onPressed: () {
              /* TODO: Uncomment when Google Login is working.
              googleSignIn.signIn().then((authCredentials) async {
                if (authCredentials != null) {
                  var authentication = await authCredentials.authentication;
                  var credential = GoogleAuthProvider.getCredential(
                      idToken: authentication.idToken,
                      accessToken: authentication.accessToken);
                  firebaseAuth.signInWithCredential(credential);
                }
              });*/
            }),
        MaterialButton(child: Text("Sign in with Facebook"), onPressed: () {}),

        /// TextFromField First Name
        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
        TextFromField(
          icon: Icons.person,
          password: false,
          label: "First Name",
          inputType: TextInputType.text,
          controller: _firstNameController,
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),

        /// TextFromField Last Name
        TextFromField(
          icon: Icons.person,
          password: false,
          label: "Last Name",
          inputType: TextInputType.text,
          controller: _lastNameController,
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
        TextFromField(
          icon: Icons.email,
          password: false,
          label: "Email",
          inputType: TextInputType.emailAddress,
          controller: _emailController,
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),

        /// TextFromField Password
        TextFromField(
          icon: Icons.vpn_key,
          password: true,
          label: "Password",
          inputType: TextInputType.text,
          controller: _passwordController,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
        ),
        TextFromField(
          icon: Icons.phone,
          password: false,
          label: "Phone Number",
          inputType: TextInputType.phone,
          controller: _phoneNumberController,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
        ),
        TextFromField(
          icon: Icons.domain,
          password: false,
          label: "Address",
          inputType: TextInputType.phone,
          controller: _addressController,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 60,
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
            ),
            value: _advisorType,
            hint: Text("Advisor Type"),
            items: [
              DropdownMenuItem(value: "Brokerage", child: Text("Brokerage")),
              DropdownMenuItem(value: "WFG", child: Text("WFG"))
            ],
            onChanged: (String value) {
              setState(() {
                _advisorType = value;
              });
            },
          ),
        ),

        /// Signup Button
        FlatButton(
            padding: EdgeInsets.only(top: 20.0),
            onPressed: () async {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => loginScreen()));
            },
            child: Text(
              "Already have an account? Sign In",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Sans"),
            )),
        Padding(
          padding: EdgeInsets.only(
              top: widget.mediaQueryData.padding.top + 105.0, bottom: 0.0),
        ),
        tap == 0
            ? InkWell(
                splashColor: Colors.yellow,
                onTap: () async {
                  setState(() {
                    tap = 1;
                  });

                  if (Form.of(context).validate()) {
                    var usersCollection =
                        Firestore.instance.collection("users");
                    var usersWithCurrentEmail = await usersCollection
                        .where("email", isEqualTo: _email)
                        .getDocuments();
                    if (usersWithCurrentEmail.documents.isEmpty) {
                      FirebaseUser user =
                          await firebaseAuth.createUserWithEmailAndPassword(
                              email: _email, password: password);
                      var userUpdateInfo = UserUpdateInfo()
                        ..displayName = "$_firstName $_lastName";

                      user.updateProfile(userUpdateInfo).then((whenDone) async {
                        debugPrint(
                            "User profile Updated. Adding user to Firestore.");
                        usersCollection.add({
                          "firstName": _firstName,
                          "lastName": _lastName,
                          "email": _email,
                          "phoneNumber": _phoneNumber,
                          "address": _address,
                          "advisorType": _advisorType,
                          "firebaseUid": await user.getIdToken(),
                          "provider": user.providerId
                        });
                      });
                      //add data to firebase

                    }
                  }
                  //_PlayAnimation();
                  return tap;
                },
                child: ButtonBlackBottom(),
              )
            : LoginAnimation(
                animationController: sanimationController.view,
              )
      ],
    );
  }
}

/// textfromfield custom class
class TextFromField extends StatelessWidget {
  //TODO: Add some form validation to these fields.
  //TODO: Make these fields single line only. No overflow.
  final bool password;
  final String label;
  final IconData icon;
  final TextInputType inputType;

  final TextEditingController controller;

  TextFromField(
      {this.label,
      this.icon,
      this.inputType,
      this.password,
      @required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        height: 60.0,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 10.0, color: Colors.black12)]),
        padding:
            EdgeInsets.only(left: 20.0, right: 30.0, top: 0.0, bottom: 0.0),
        child: Theme(
          data: ThemeData(
            hintColor: Colors.transparent,
          ),
          child: TextFormField(
            controller: controller,
            obscureText: password,
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: label,
                icon: Icon(
                  icon,
                  color: Colors.black38,
                ),
                labelStyle: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Sans',
                    letterSpacing: 0.3,
                    color: Colors.black38,
                    fontWeight: FontWeight.w600)),
            keyboardType: inputType,
          ),
        ),
      ),
    );
  }
}

///ButtonBlack class
class ButtonBlackBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Container(
        height: 55.0,
        width: 600.0,
        child: Text(
          "Sign Up",
          style: TextStyle(
              color: Colors.white,
              letterSpacing: 0.2,
              fontFamily: "Sans",
              fontSize: 18.0,
              fontWeight: FontWeight.w800),
        ),
        alignment: FractionalOffset.center,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 15.0)],
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
                colors: <Color>[Color(0xFF121940), Color(0xFF6E48AA)])),
      ),
    );
  }
}
