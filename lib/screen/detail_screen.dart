import 'package:flutter/material.dart';
import '../widget/my_button.dart';
import './cart_screen.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int addAndRemove = 1;
  Widget _buildIconButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.remove,
            color: Color(0xff03d4ee),
          ),
          onPressed: () {
            setState(() {
              if (addAndRemove > 1) {
                addAndRemove--;
              }
            });
          },
        ),
        Text(
          "${addAndRemove.toString()}",
          style: TextStyle(
            fontSize: 20,
            color: Color(0xff03d4ee),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.add,
            color: Color(0xff03d4ee),
          ),
          onPressed: () {
            setState(() {
              addAndRemove++;
            });
          },
        ),
      ],
    );
  }

  Widget _buildContainer(
      String text, String text1, String text2, String text3) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xffc1c6cc),
                  ),
                ),
                Text(
                  text1,
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xffff2d9d),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  text2,
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xffc1c6cc),
                  ),
                ),
                Text(
                  text3,
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xffc1c6cc),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTexts() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Chicken Brost",
                  style: TextStyle(
                      fontSize: 38,
                      color: Color(0xffff3ea5),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Marine Star Hotel",
                  style: TextStyle(fontSize: 25, color: Color(0xffc1c6cc)),
                ),
              ],
            ),
          ),
          Container(
            height: 110,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "\$50",
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xff03d4ee),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xffebfcfe),
                  ),
                  height: 37,
                  width: 120,
                  child: _buildIconButton(),
                ),
                SizedBox(
                  width: 0,
                ),
              ],
            ),
          ),
          Container(
            // height: 160,
            child: Column(
              children: <Widget>[
                _buildContainer(
                    "Weight", "120kg", "Mix together", "milk, eggs, dip"),
                _buildContainer(
                    "Colories", "430 ccal", "chicken in this", "Mixture"),
              ],
            ),
          ),
          Container(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                MyButton(
                  color: Color(0xffff3fa6),
                  color1: Colors.white,
                  text: "Submit",
                  whenpress: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => CartScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Color(0xfffef6fa),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Color(0xffffffff),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _buildTexts(),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 60,
              left: 100,
              child: CircleAvatar(
                maxRadius: 120,
                backgroundColor: Colors.black38,
                backgroundImage: AssetImage("image/cheese.jpg"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
