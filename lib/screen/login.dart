import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widget/my_button.dart';
import './signup.dart';
import '../widget/textformfilde.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;
  final _auth = FirebaseAuth.instance;
  AuthResult authResult;
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  final RegExp regex = RegExp(pattern);

  final TextEditingController email = TextEditingController();
  final TextEditingController pasword = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  void submit() async {
    try {
      setState(() {
        _isLoading = true;
      });
      authResult = await _auth.signInWithEmailAndPassword(
          email: email.text, password: pasword.text);
    } on PlatformException catch (error) {
      var message = 'An error occurred, pelase check your credentials!';
      if (error.message != null) {
        message = error.message;
      }
      _scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
    }
    setState(() {
      _isLoading = false;
    });
  }

  validationText() {
    if (email.text.isEmpty || email.text.trim() == null) {
      _scaffold.currentState
          .showSnackBar(SnackBar(content: Text("Email is Empty")));
    } else if (!regex.hasMatch(email.text)) {
      _scaffold.currentState.showSnackBar(SnackBar(
        content: Text("Please Try Vaild Email"),
      ));
    } else if (pasword.text.isEmpty || pasword.text.trim() == null) {
      _scaffold.currentState
          .showSnackBar(SnackBar(content: Text("Password is Empty")));
    }
    submit();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        key: _scaffold,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 35,
                            color: Color(0xfffe257e),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "welcome back!",
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xfffe257e),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 220,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextFormFild(
                        obscureText: false,
                        text: "Email",
                        controller: email,
                      ),
                      TextFormFild(
                        obscureText: true,
                        text: "Password",
                        controller: pasword,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      if (_isLoading)
                        CircularProgressIndicator(
                          backgroundColor: Colors.deepOrange,
                        ),
                      if (!_isLoading)
                        MyButton(
                            // color1: Color(0xffffffff),
                            // color: Color(0xfffe257e),
                            text: "Login",
                            whenpress: () {
                              validationText();
                            }),
                      // CircularProgressIndicator(
                      //     backgroundColor: Colors.deepOrange,
                      //   ),
                      Row(
                        children: <Widget>[
                          Text(
                            "don't have account?",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          if (!_isLoading)
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (ctx) => Signup(),
                                  ),
                                );
                              },
                              child: Text(
                                "Signup",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
                                ),
                              ),
                            )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}