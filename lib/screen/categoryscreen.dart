import 'package:flutter/material.dart';
import '../widget/category_product.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CategoryProduct(
                      text1: "7 Ocean Hotel",
                      text: "Pasta Cheese",
                      text2: "4.5 Reatings",
                      image: "image/Foods.jpg",
                      text3: "\$50",
                    ),
                    CategoryProduct(
                      text1: "7 Ocean Hotel",
                      text: "Pasta Cheese",
                      text2: "4.5 Reatings",
                      image: "image/Foods.jpg",
                      text3: "\$50",
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    CategoryProduct(
                      text1: "7 Ocean Hotel",
                      text: "Pasta Cheese",
                      text2: "4.5 Reatings",
                      image: "image/Foods.jpg",
                      text3: "\$50",
                    ),
                    CategoryProduct(
                      text1: "7 Ocean Hotel",
                      text: "Pasta Cheese",
                      text2: "4.5 Reatings",
                      image: "image/Foods.jpg",
                      text3: "\$50",
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    CategoryProduct(
                      text1: "7 Ocean Hotel",
                      text: "Pasta Cheese",
                      text2: "4.5 Reatings",
                      image: "image/Foods.jpg",
                      text3: "\$50",
                    ),
                    CategoryProduct(
                      text1: "7 Ocean Hotel",
                      text: "Pasta Cheese",
                      text2: "4.5 Reatings",
                      image: "image/Foods.jpg",
                      text3: "\$50",
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    CategoryProduct(
                      text1: "7 Ocean Hotel",
                      text: "Pasta Cheese",
                      text2: "4.5 Reatings",
                      image: "image/Foods.jpg",
                      text3: "\$50",
                    ),
                    CategoryProduct(
                      text1: "7 Ocean Hotel",
                      text: "Pasta Cheese",
                      text2: "4.5 Reatings",
                      image: "image/Foods.jpg",
                      text3: "\$50",
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
