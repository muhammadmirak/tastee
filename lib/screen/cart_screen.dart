import 'package:flutter/material.dart';
import '../widget/my_button.dart';
import './profile_screen.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Widget _buildContainer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 80,
      color: Color(0xffffffff),
      width: double.infinity,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          CircleAvatar(
            maxRadius: 40,
            backgroundImage: AssetImage("image/Foods.jpg"),
          ),
          Text(
            "1x",
            style: TextStyle(fontSize: 25, color: Color(0xffd1d6d8)),
          ),
          Container(
            height: 50,
            child: Column(
              children: <Widget>[
                Text(
                  "Pasta Cheese",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "7 Ocean Hotel",
                  style: TextStyle(fontSize: 20, color: Color(0xffd1d6d8)),
                ),
              ],
            ),
          ),
          Text(
            "\$50",
            style: TextStyle(
                fontSize: 25,
                color: Color(0xff01d4ee),
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget _buildColumn() {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Total",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text("\$350",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ],
          ),
        ),
        MyButton(
          color1: Color(0xffff3fa6),
          color: Color(0xffffffff),
          text: "Submint",
          whenpress: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => ProfileScreen()),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff7f8f8),
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {}),
          elevation: 0.0,
          title: Center(
              child: Text(
            "Cart",
            style: TextStyle(
              color: Colors.black,
            ),
          )),
          backgroundColor: Color(0xfff7f8f8),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xfff7f8f8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          _buildContainer(),
                          _buildContainer(),
                          _buildContainer(),
                          _buildContainer(),
                          _buildContainer(),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Color(0xffff3ea5),
                      child: _buildColumn(),
                    ),
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
