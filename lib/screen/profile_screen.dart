import 'package:flutter/material.dart';
import '../widget/textformfilde.dart';
import '../widget/my_button.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool iconButton = false;

  Widget _buildConatiner(String text) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        color: Color(0xfffde6f0),
      ),
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }

  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  final RegExp regex = RegExp(pattern);

  bool edit = false;
  final TextEditingController fullname =
      TextEditingController(text: "Brie Larson");
  final TextEditingController email =
      TextEditingController(text: "mirakbaloch@gmail.com");
  final TextEditingController phonenumber =
      TextEditingController(text: "+93422397488");
  final TextEditingController gender = TextEditingController(text: "Male");
  final TextEditingController address =
      TextEditingController(text: "Zafar Colory");
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  validationText() {
    if (fullname.text.isEmpty || fullname.text.trim() == null) {
      _scaffold.currentState
          .showSnackBar(SnackBar(content: Text("Full Name is Empty")));
    } else if (email.text.isEmpty || email.text.trim() == null) {
      _scaffold.currentState
          .showSnackBar(SnackBar(content: Text("Email is Empty")));
    } else if (phonenumber.text.isEmpty || phonenumber.text.trim() == null) {
      _scaffold.currentState
          .showSnackBar(SnackBar(content: Text("Phone Number is Empty")));
    } else if (!regex.hasMatch(email.text)) {
      _scaffold.currentState.showSnackBar(SnackBar(
        content: Text("Please Try Vaild Email"),
      ));
    } else if (gender.text.isEmpty || gender.text.trim() == null) {
      _scaffold.currentState
          .showSnackBar(SnackBar(content: Text("Gender is Empty")));
    } else if (address.text.isEmpty || address.text.trim() == null) {
      _scaffold.currentState
          .showSnackBar(SnackBar(content: Text("Address is Empty")));
    }
  }

  File image;
  Future getImage({ImageSource source}) async {
    final pickedImage = await ImagePicker().getImage(source: source);
    setState(() {
      image = File(pickedImage.path);
    });
  }

  Widget _buildtextImage() {
    return Container(
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              child: CircleAvatar(
                radius: 85,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: image == null
                      ? AssetImage("image/jacksparrow.jpg")
                      : FileImage(image),
                ),
              ),
            ),
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(top: 80, left: 145),
              child: Center(
                  child: edit == true
                      ? CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 19,
                          child: IconButton(
                              icon: Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                getImage(source: ImageSource.camera);
                              }),
                        )
                      : null),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAllContext() {
    return Stack(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Color(0xffff3ea5),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  color: Color(0xfff7f8f8),
                  child: Container(
                    child: ListView(
                      children: <Widget>[
                        Container(
                          height: 420,
                          child: edit == true
                              ? Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                      keyboard: TextInputType.number,
                                      text: "Phone Number",
                                      controller: phonenumber,
                                    ),
                                    TextFormFild(
                                      obscureText: false,
                                      text: "Gender",
                                      controller: gender,
                                    ),
                                    TextFormFild(
                                      obscureText: false,
                                      text: "Adders",
                                      controller: address,
                                    ),
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    _buildConatiner("mirak"),
                                    _buildConatiner("mirakbaloch@gmail.com"),
                                    _buildConatiner("+923422397488"),
                                    _buildConatiner("Male"),
                                    _buildConatiner("Zafar Colory"),
                                  ],
                                ),
                        ),
                        Column(
                          children: <Widget>[
                            edit == true
                                ? MyButton(
                                    color1: Color(0xffffffff),
                                    color: Color(0xfffe257e),
                                    text: "Update",
                                    whenpress: () {
                                      validationText();
                                    },
                                  )
                                : Container(),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.only(bottom: 388), child: _buildtextImage())
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffold,
        appBar: AppBar(
          leading: edit == true
              ? IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (cxt) => ProfileScreen(),
                    ));
                  })
              : IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
          elevation: 0.0,
          backgroundColor: Color(0xffff3ea5),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: 0,
              ),
              Text("Profile"),
              GestureDetector(
                child: Text("Edit"),
                onTap: () {
                  setState(() {
                    edit = true;
                  });
                },
              ),
            ],
          ),
        ),
        body: _buildAllContext(),
      ),
    );
  }
}
