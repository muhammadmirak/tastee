import 'package:flutter/material.dart';
import '../screen/detail_screen.dart';

class CategoryProduct extends StatelessWidget {
  String name;
  String type;
  String rating;
  String price;
  Function whenPress;
  var image;
  CategoryProduct({this.name, this.type, this.rating, this.price, this.image});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 180,
              width: 150,
              color: Color(0xffffffff),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
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
          Padding(
            padding: const EdgeInsets.only(left: 80),
            child: CircleAvatar(
              maxRadius: 60,
              backgroundImage: NetworkImage(image),
            ),
          ),
        ],
      ),
    );
  }
}
