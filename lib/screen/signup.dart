import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../widget/my_button.dart';
import './home_screen.dart';
import '../widget/textformfilde.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/user.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isMale = false;
  final _auth = FirebaseAuth.instance;
  AuthResult authResult;
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  final RegExp regex = RegExp(pattern);

  final TextEditingController fullname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phonenumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController adders = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  File myImage;
  Future getImage() async {
    var myPickedImage =
        await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      myImage = File(myPickedImage.path);
    });
  }

  Future<Map<String, String>> _uploadFile(File _image) async {
    String _imagePath = _image.path;

    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('images/${Path.basename(_imagePath)}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    StorageTaskSnapshot task = await uploadTask.onComplete;
    final String _imageUrl = (await task.ref.getDownloadURL());

    Map<String, String> _downloadData = {
      'imagePath': Path.basename(_imagePath),
      'imageUrl': _imageUrl
    };
    return _downloadData;
  }

  void submit() async {
    try {
      authResult = await _auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      var imageMap = await _uploadFile(myImage);

      User user = User(
        image: imageMap['imageUrl'],
        userPath: imageMap['imagePath'],
        userEmail: email.text,
        userName: fullname.text,
        userGender: isMale ? "Male" : "Female",
        userAdders: adders.text,
        userNumber: int.parse(phonenumber.text),
        userPassword: password.text,
      );

      await Firestore.instance
          .collection("user")
          .document(authResult.user.uid)
          .setData({
        "userName": user.userName,
        "userEmail": user.userEmail,
        "userNumber": user.userNumber,
        "userPassword": user.userPassword,
        "userGender": user.userGender,
        "userAdders": user.userAdders,
        "user_image": user.image,
        'userId': authResult.user.uid,
        'userPath': user.userPath,
      });
    } on PlatformException catch (error) {
      var message = 'An error occurred, pelase check youe credentials!';
      if (error.message != null) {
        message = error.message;
      }
      _scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    } catch (error) {}
  }

  validationText() {
    if (myImage == null) {
      _scaffold.currentState
          .showSnackBar(SnackBar(content: Text("Please Pick Image")));
    } else if (fullname.text.isEmpty || fullname.text.trim() == null) {
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
    } else if (password.text.isEmpty || password.text.trim() == null) {
      _scaffold.currentState
          .showSnackBar(SnackBar(content: Text("Password is Empty")));
    } else if (adders.text.isEmpty || adders.text.trim() == null) {
      _scaffold.currentState
          .showSnackBar(SnackBar(content: Text("Adders is Empty")));
    }
    submit();
  }

  Widget _buildimages() {
    return CircleAvatar(
      maxRadius: 60,
      backgroundColor: Color(0xfffe257e),
      child: GestureDetector(
        onTap: () {
          getImage();
        },
        child: CircleAvatar(
          maxRadius: 55,
          backgroundImage: myImage == null
              ? AssetImage("image/Foods.jpg")
              : FileImage(myImage),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Signup",
                            style: TextStyle(
                                fontSize: 35,
                                color: Color(0xfffe257e),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "create an account",
                            style: TextStyle(
                              fontSize: 25,
                              color: Color(0xfffe257e),
                            ),
                          ),
                        ],
                      ),
                      _buildimages(),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        height: 400,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            TextFormFild(
                              text: "Full Name",
                              obscureText: false,
                              controller: fullname,
                            ),
                            TextFormFild(
                              obscureText: false,
                              text: "Email",
                              controller: email,
                            ),
                            TextFormFild(
                              obscureText: true,
                              text: "Password",
                              controller: password,
                            ),
                            TextFormFild(
                              obscureText: false,
                              text: "Phone Number",
                              controller: phonenumber,
                              keyboard: TextInputType.number,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isMale = !isMale;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xfffde6f0),
                                    borderRadius: BorderRadius.circular(20)),
                                height: 60,
                                padding: EdgeInsets.only(left: 10),
                                width: double.infinity,
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      isMale ? "Male" : "Female",
                                      style:
                                          TextStyle(color: Color(0xff746a6e)),
                                    )),
                              ),
                            ),
                            TextFormFild(
                              text: "Addres",
                              obscureText: false,
                              controller: adders,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      MyButton(
                        color1: Color(0xffffffff),
                        color: Color(0xfffe257e),
                        text: "Signup",
                        whenpress: () {
                          validationText();
                        },
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "already have an account?",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => HomeScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(fontSize: 20, color: Colors.red),
                            ),
                          ),
                        ],
                      ),
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
