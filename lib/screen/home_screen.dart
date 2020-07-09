import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testee/model/foodmodel.dart';
import 'package:testee/screen/contact.dart';
import './about.dart';
import './cart_screen.dart';
import './detail_screen.dart';
import './profile_screen.dart';
import './categoryscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../searchbar/search.dart';
import '../searchbar/data_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FoodModel pasta;
  FoodModel chickenbrost;
  var uid;
  String image;

  Widget _buildIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
            icon: Icon(
              Icons.notifications,
            ),
            onPressed: () {}),
      ],
    );
  }

  Widget _buildImageText() {
    return Container(
      margin: EdgeInsets.only(left: 25, top: 10),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            maxRadius: 50,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              maxRadius: 45,
              backgroundImage: NetworkImage(image),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Have you upset",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Stomach?",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormField(String text) {
    return TextFormField(
      decoration: InputDecoration(
          fillColor: Color(0xffffffff),
          filled: true,
          // labelText: text,
          hintText: text,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch(listWords));
            },
          )),
    );
  }

  Widget _buildContainer(String name, var image) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => CategoryScreen(),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xffffffff),
                ),
                height: 160,
                width: 160,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      image,
                      width: 100,
                    ),
                    Text(
                      name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Featured",
          style: TextStyle(
              fontSize: 20,
              color: Color(0xff03d4ee),
              fontWeight: FontWeight.bold),
        ),
        Text(
          "View All",
          style: TextStyle(
            fontSize: 20,
            color: Color(0xff03d4ee),
          ),
        )
      ],
    );
  }

  Widget _buildContainerText(
    String name,
    String type,
    String rating,
    String price,
    var image,
  ) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: GestureDetector(
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (ctx) => DetailScreen(
                //       foodImage: pasta.foodImage,
                //       foodName: pasta.foodName,
                //       foodPrice: pasta.foodPrice,
                //       foodType: pasta.foodType,
                //     ),
                //   ),
                // );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 180,
                width: 180,
                color: Color(0xffffffff),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              name,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(type),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text("$rating Rating"),
                            Text(
                              "\$$price",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff03d4ee)),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 95),
            child: CircleAvatar(
              maxRadius: 65,
              backgroundImage: NetworkImage(image),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 0.0,
      actions: <Widget>[
        _buildIcon(),
      ],
    );
  }

  Widget _buildAllContext() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Theme.of(context).primaryColor,
                  child: Column(
                    children: <Widget>[
                      _buildImageText(),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      color: Color(0xfff4f5f6),
                      child: Column(
                        children: <Widget>[
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                _buildContainer("Pizza", "image/pizza.png"),
                                _buildContainer("Salads", "image/salad.png"),
                                _buildContainer("Meat", "image/meat.png"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(children: <Widget>[
                        _buildText(),
                      ]),
                    ),
                    Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (ctx) => DetailScreen(
                                      foodImage: pasta.foodImage,
                                      foodName: pasta.foodName,
                                      foodPrice: pasta.foodPrice,
                                      foodType: pasta.foodType,
                                    ),
                                  ),
                                );
                              },
                              child: _buildContainerText(
                                  pasta.foodName,
                                  pasta.foodType,
                                  pasta.foodRate.toString(),
                                  pasta.foodPrice.toString(),
                                  pasta.foodImage),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (ctx) => DetailScreen(
                                      foodImage: chickenbrost.foodImage,
                                      foodName: chickenbrost.foodName,
                                      foodPrice: chickenbrost.foodPrice,
                                      foodType: chickenbrost.foodType,
                                    ),
                                  ),
                                );
                              },
                              child: _buildContainerText(
                                chickenbrost.foodName,
                                chickenbrost.foodType,
                                chickenbrost.foodRate.toString(),
                                chickenbrost.foodPrice.toString(),
                                chickenbrost.foodImage,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 155,
            left: 25,
            child: Container(
              height: 60,
              width: 380,
              child: _buildTextFormField("Want to search anything"),
            ),
          )
        ],
      ),
    );
  }

  Widget _drawarCardWidget({IconData icons, String name, Function whenPress}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: Colors.white,
      child: ListTile(
        onTap: whenPress,
        leading: IconButton(
          icon: Icon(icons),
          onPressed: () {},
        ),
        title: Container(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
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
        drawer: Drawer(
          child: SafeArea(
            child: Container(
              color: Color(0xfff8f8f8),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 80,
                    child: DrawerHeader(
                      child: Text(
                        'Tastee',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Divider(
                    indent: 14,
                    endIndent: 14,
                  ),
                  _drawarCardWidget(
                    icons: Icons.home,
                    name: 'Home',
                    whenPress: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    },
                  ),
                  _drawarCardWidget(
                      icons: Icons.shopping_cart,
                      name: 'Cart',
                      whenPress: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => CartScreen()));
                      }),
                  _drawarCardWidget(
                      icons: Icons.location_on,
                      name: 'Address',
                      whenPress: () {}),
                  _drawarCardWidget(
                      icons: Icons.notifications_none,
                      name: 'Notification',
                      whenPress: () {}),
                  _drawarCardWidget(
                      icons: Icons.perm_identity,
                      name: 'Profile',
                      whenPress: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                      }),
                  _drawarCardWidget(
                      icons: Icons.perm_identity,
                      name: 'Orders',
                      whenPress: () {}),
                  Divider(
                    indent: 14,
                    endIndent: 14,
                  ),
                  _drawarCardWidget(
                    icons: Icons.info,
                    name: 'About',
                    whenPress: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => About()));
                    },
                  ),
                  _drawarCardWidget(
                    icons: Icons.phone,
                    name: 'Contact',
                    whenPress: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Contact()));
                    },
                  ),
                  Divider(
                    indent: 14,
                    endIndent: 14,
                  ),
                  _drawarCardWidget(
                    icons: Icons.exit_to_app,
                    name: 'Logout',
                    whenPress: () {
                      FirebaseAuth.instance.signOut();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: StreamBuilder(
          stream: Firestore.instance.collection("food").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            pasta = FoodModel(
                foodName: snapshot.data.documents[0]["foodName"],
                foodPrice: snapshot.data.documents[0]["foodPrice"],
                foodType: snapshot.data.documents[0]["foodType"],
                foodImage: snapshot.data.documents[0]["foodImage"],
                foodRate: snapshot.data.documents[0]["foodRating"]);
            chickenbrost = FoodModel(
                foodName: snapshot.data.documents[1]["foodName"],
                foodPrice: snapshot.data.documents[1]["foodPrice"],
                foodType: snapshot.data.documents[1]["foodType"],
                foodImage: snapshot.data.documents[1]["foodImage"],
                foodRate: snapshot.data.documents[1]["foodRating"]);
            return StreamBuilder(
              stream: Firestore.instance.collection("user").snapshots(),
              builder: (context, userimage) {
                if (userimage.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                var myDocument = userimage.data.documents;
                myDocument.forEach((userimage) {
                  if (uid == userimage["userId"]) {
                    image = userimage["user_image"];
                  }
                });
                return _buildAllContext();
              },
            );
          },
        ),
      ),
    );
  }
}
