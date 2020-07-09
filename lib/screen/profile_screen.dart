import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:testee/screen/home_screen.dart';
import '../widget/textformfilde.dart';
import '../widget/my_button.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../model/user.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static User user;
  bool isMale = true;
  bool columnText = false;
  String userimage;
  void checkGender() {
    if (user.userGender == "Male") {
      isMale = true;
    } else {
      isMale = false;
    }
  }

  Widget _buildConatiner(String text) {
    checkGender();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        color: Color(0x5028d1a7),
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
  var uid;
  TextEditingController fullname;

  TextEditingController email;

  TextEditingController phonenumber;

  TextEditingController address;

  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  File image;
  Future getImage({ImageSource source}) async {
    final pickedImage = await ImagePicker().getImage(source: source);
    setState(() {
      image = File(pickedImage.path);
    });
  }

  Future<String> _uploadFile(File _image) async {
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child('images/${user.userPath}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    StorageTaskSnapshot task = await uploadTask.onComplete;
    final String _imageUrl = (await task.ref.getDownloadURL());

    return _imageUrl;
  }

  var updateImage;
  void userUpdate() async {
    image != null ? updateImage = await _uploadFile(image) : Container();

    Firestore.instance.collection("user").document(uid).updateData({
      "userAdders": address.text,
      "userEmail": email.text,
      "userName": fullname.text,
      "userNumber": int.parse(phonenumber.text),
      "userGender": isMale == true ? "Male" : "Female",
      'user_image': image == null ? user.image : updateImage,
    });
    setState(() {
      columnText = false;
    });
  }

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
    } else if (address.text.isEmpty || address.text.trim() == null) {
      _scaffold.currentState
          .showSnackBar(SnackBar(content: Text("Address is Empty")));
    } else {
      setState(() {
        edit = false;
      });
    }
    userUpdate();
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
                      ? NetworkImage(user.image)
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
                  color: Theme.of(context).primaryColor,
                  // color: Color(0xffff3ea5),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  color: Color(0xfff7f8f8),
                  child: Container(
                    child: Column(
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
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isMale = !isMale;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Color(0x5028d1a7),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: 60,
                                        padding: EdgeInsets.only(left: 10),
                                        width: double.infinity,
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              isMale ? "Male" : "Female",
                                              style: TextStyle(
                                                  color: Color(0xff746a6e)),
                                            )),
                                      ),
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
                                    _buildConatiner(user.userName),
                                    _buildConatiner(user.userEmail),
                                    _buildConatiner(user.userNumber.toString()),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Color(0x5028d1a7),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: 60,
                                      padding: EdgeInsets.only(left: 10),
                                      width: double.infinity,
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            isMale ? "Male" : "Female",
                                            style: TextStyle(
                                                color: Color(0xff746a6e)),
                                          )),
                                    ),
                                    _buildConatiner(user.userAdders),
                                  ],
                                ),
                        ),
                        Column(
                          children: <Widget>[
                            edit == true
                                ? MyButton(
                                    // color1: Color(0xffffffff),
                                    // color: Color(0xfffe257e),
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

  void getUserData() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    uid = user.uid;
  }

  @override
  Widget build(BuildContext context) {
    getUserData();

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffold,
        appBar: AppBar(
          leading: edit == true
              ? IconButton(
                  icon: Icon(
                    Icons.close,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (cxt) => ProfileScreen(),
                    ));
                  })
              : IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (cxt) => HomeScreen(),
                    ));
                  }),
          elevation: 0.0,
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
        body: StreamBuilder(
            stream: Firestore.instance.collection("user").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              var myDocument = snapshot.data.documents;
              myDocument.forEach((checkDocument) {
                if (uid == checkDocument["userId"]) {
                  user = User(
                      userPath: checkDocument['userPath'],
                      userEmail: checkDocument["userEmail"],
                      userName: checkDocument["userName"],
                      userNumber: checkDocument["userNumber"],
                      userPassword: checkDocument["userPassword"],
                      userGender: checkDocument["userGender"],
                      userAdders: checkDocument["userAdders"],
                      image: checkDocument['user_image']);
                  userimage = checkDocument["user_image"];
                  fullname = TextEditingController(text: user.userName);
                  email = TextEditingController(text: user.userEmail);
                  phonenumber =
                      TextEditingController(text: user.userNumber.toString());
                  address = TextEditingController(text: user.userAdders);
                }
              });
              return _buildAllContext();
            }),
      ),
    );
  }
}
