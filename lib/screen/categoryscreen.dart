import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testee/model/foodmodel.dart';
import '../widget/category_product.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  FoodModel chickenfood;
  FoodModel pastafood;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: Firestore.instance
              .collection("category")
              .document("vegetable")
              .collection("chickenbrost")
              .document("FOiZg0Fi4T02jB87TI3h")
              .snapshots(),
          builder: (context, chickenSnapShot) {
            if (chickenSnapShot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            chickenfood = FoodModel(
              foodName: chickenSnapShot.data["foodName"],
              foodPrice: chickenSnapShot.data["foodPrice"],
              foodType: chickenSnapShot.data["foodTitle"],
              foodImage: chickenSnapShot.data["foodImage"],
              foodRate: chickenSnapShot.data["foodRating"],
            );
            return StreamBuilder(
              stream: Firestore.instance
                  .collection("category")
                  .document("vegetable")
                  .collection("pastachesse")
                  .document("o1mJEFvdsmVdpbSmwvuC")
                  .snapshots(),
              builder: (context, pastaSnapShot) {
                if (pastaSnapShot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                pastafood = FoodModel(
                  foodName: pastaSnapShot.data["foodName"],
                  foodPrice: pastaSnapShot.data["foodPrice"],
                  foodType: pastaSnapShot.data["foodType"],
                  foodImage: pastaSnapShot.data["foodImage"],
                  foodRate: pastaSnapShot.data["foodRating"],
                );
                return GridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.only(top: 20),
                  children: <Widget>[
                    CategoryProduct(
                      text1: chickenfood.foodName,
                      text: chickenfood.foodType,
                      text2: chickenfood.foodRate.toString(),
                      image: chickenfood.foodImage,
                      text3: chickenfood.foodPrice.toString(),
                    ),
                    CategoryProduct(
                      text1: chickenfood.foodName,
                      text: chickenfood.foodType,
                      text2: chickenfood.foodRate.toString(),
                      image: chickenfood.foodImage,
                      text3: chickenfood.foodPrice.toString(),
                    ),
                    CategoryProduct(
                      text1: chickenfood.foodName,
                      text: chickenfood.foodType,
                      text2: chickenfood.foodRate.toString(),
                      image: chickenfood.foodImage,
                      text3: chickenfood.foodPrice.toString(),
                    ),
                    CategoryProduct(
                      text1: pastafood.foodName,
                      text: pastafood.foodType,
                      text2: pastafood.foodRate.toString(),
                      image: pastafood.foodImage,
                      text3: pastafood.foodPrice.toString(),
                    ),
                    CategoryProduct(
                      text1: pastafood.foodName,
                      text: pastafood.foodType,
                      text2: pastafood.foodRate.toString(),
                      image: pastafood.foodImage,
                      text3: pastafood.foodPrice.toString(),
                    ),
                    CategoryProduct(
                      text1: pastafood.foodName,
                      text: pastafood.foodType,
                      text2: pastafood.foodRate.toString(),
                      image: pastafood.foodImage,
                      text3: pastafood.foodPrice.toString(),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
