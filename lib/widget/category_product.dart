import 'package:flutter/material.dart';
import '../screen/detail_screen.dart';

class CategoryProduct extends StatelessWidget {
  String text;
  String text1;
  String text2;
  String text3;
  var image;
  CategoryProduct({this.text, this.text1, this.text2, this.text3, this.image});
  @override
  Widget build(BuildContext context) {
    return Stack(
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
            maxRadius: 60,
            backgroundImage: AssetImage(image),
          ),
        ),
      ],
    );
  }
}
