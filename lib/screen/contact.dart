import 'package:flutter/material.dart';
import 'package:testee/screen/home_screen.dart';
import '../widget/my_button.dart';
import '../widget/textformfilde.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  final RegExp regex = RegExp(pattern);

  final TextEditingController fullname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phonenumber = TextEditingController();
  final TextEditingController yourmessage = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  validationText() {
    if (fullname.text.isEmpty || fullname.text.trim() == null) {
      _scaffold.currentState
          .showSnackBar(SnackBar(content: Text("Full Name is Empty")));
    } else if (email.text.isEmpty || email.text.trim() == null) {
      _scaffold.currentState
          .showSnackBar(SnackBar(content: Text("Email is Empty")));
    } else if (!regex.hasMatch(email.text)) {
      _scaffold.currentState.showSnackBar(SnackBar(
        content: Text("Please Try Vaild Email"),
      ));
    } else if (phonenumber.text.isEmpty || phonenumber.text.trim() == null) {
      _scaffold.currentState
          .showSnackBar(SnackBar(content: Text("Phone Number is Empty")));
    } else if (yourmessage.text.isEmpty || yourmessage.text.trim() == null) {
      _scaffold.currentState
          .showSnackBar(SnackBar(content: Text("Gender is Empty")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              }),
          title: Center(
              child: Text(
            "Contact",
            style: TextStyle(fontSize: 30, color: Colors.black),
          )),
        ),
        key: _scaffold,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 100,
                  ),
                  Container(
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextFormFild(
                          obscureText: false,
                          text: "Full Name",
                          controller: fullname,
                        ),
                        TextFormFild(
                          obscureText: false,
                          text: "Email",
                          controller: email,
                        ),
                        TextFormFild(
                          obscureText: false,
                          text: "Phone Number",
                          controller: phonenumber,
                        ),
                        TextFormFild(
                          obscureText: false,
                          text: "Your Message",
                          controller: yourmessage,
                        ),
                        MyButton(
                          // color1: Color(0xffffffff),
                          // color: Color(0xfffe257e),
                          text: "Send",
                          whenpress: () {
                            validationText();
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
