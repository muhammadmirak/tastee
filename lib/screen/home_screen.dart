import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './about.dart';
import './cart_screen.dart';
import './detail_screen.dart';
import './profile_screen.dart';
import './categoryscreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
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
              backgroundImage: AssetImage("image/Foods.jpg"),
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
          labelText: text,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          suffixIcon: Icon(Icons.search)),
    );
  }

  Widget _buildContainer(String text, var image) {
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
                      text,
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
      String text, String text1, String text2, String text3, var image) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => DetailScreen(),
                  ),
                );
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
                              text,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(text1),
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
                            Text(text2),
                            Text(
                              text3,
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
              backgroundImage: AssetImage(image),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xfffe257e),
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
                  color: Color(0xfffe257e),
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
                            _buildContainerText("Pasta Cheese", "7 Ocean Hotel",
                                "4.5 Reatings", "\$50", "image/Foods.jpg"),
                            _buildContainerText(
                                "Chicken Brost",
                                "Marine Star Hotel",
                                "4.5 Reatings",
                                "\$50",
                                "image/maxresdefault.jpg"),
                            _buildContainerText("Pasta Cheese", "7 Ocean Hotel",
                                "4.5 Reatings", "\$50", "image/Foods.jpg"),
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

  @override
  Widget build(BuildContext context) {
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
                          MaterialPageRoute(builder: (context) => Container()));
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
        body: _buildAllContext(),
      ),
    );
  }
}
