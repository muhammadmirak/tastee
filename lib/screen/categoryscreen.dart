import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testee/model/foodmodel.dart';
import '../widget/category_product.dart';
import '../screen/detail_screen.dart';

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
        appBar: AppBar(
          backgroundColor: Color(0xfffafafa),
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => DetailScreen(
                              foodImage: chickenfood.foodImage,
                              foodName: chickenfood.foodName,
                              foodPrice: chickenfood.foodPrice,
                              foodType: chickenfood.foodType,
                            ),
                          ),
                        );
                      },
                      child: CategoryProduct(
                        type: chickenfood.foodType,
                        name: chickenfood.foodName,
                        rating: chickenfood.foodRate.toString(),
                        image: chickenfood.foodImage,
                        price: chickenfood.foodPrice.toString(),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => DetailScreen(
                              foodImage: chickenfood.foodImage,
                              foodName: chickenfood.foodName,
                              foodPrice: chickenfood.foodPrice,
                              foodType: chickenfood.foodType,
                            ),
                          ),
                        );
                      },
                      child: CategoryProduct(
                        type: chickenfood.foodType,
                        name: chickenfood.foodName,
                        rating: chickenfood.foodRate.toString(),
                        image: chickenfood.foodImage,
                        price: chickenfood.foodPrice.toString(),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => DetailScreen(
                              foodImage: chickenfood.foodImage,
                              foodName: chickenfood.foodName,
                              foodPrice: chickenfood.foodPrice,
                              foodType: chickenfood.foodType,
                            ),
                          ),
                        );
                      },
                      child: CategoryProduct(
                        type: chickenfood.foodType,
                        name: chickenfood.foodName,
                        rating: chickenfood.foodRate.toString(),
                        image: chickenfood.foodImage,
                        price: chickenfood.foodPrice.toString(),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => DetailScreen(
                              foodImage: pastafood.foodImage,
                              foodName: pastafood.foodName,
                              foodPrice: pastafood.foodPrice,
                              foodType: pastafood.foodType,
                            ),
                          ),
                        );
                      },
                      child: CategoryProduct(
                        type: pastafood.foodType,
                        name: pastafood.foodName,
                        rating: pastafood.foodRate.toString(),
                        image: pastafood.foodImage,
                        price: pastafood.foodPrice.toString(),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => DetailScreen(
                              foodImage: pastafood.foodImage,
                              foodName: pastafood.foodName,
                              foodPrice: pastafood.foodPrice,
                              foodType: pastafood.foodType,
                            ),
                          ),
                        );
                      },
                      child: CategoryProduct(
                        type: pastafood.foodType,
                        name: pastafood.foodName,
                        rating: pastafood.foodRate.toString(),
                        image: pastafood.foodImage,
                        price: pastafood.foodPrice.toString(),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => DetailScreen(
                              foodImage: pastafood.foodImage,
                              foodName: pastafood.foodName,
                              foodPrice: pastafood.foodPrice,
                              foodType: pastafood.foodType,
                            ),
                          ),
                        );
                      },
                      child: CategoryProduct(
                        type: pastafood.foodType,
                        name: pastafood.foodName,
                        rating: pastafood.foodRate.toString(),
                        image: pastafood.foodImage,
                        price: pastafood.foodPrice.toString(),
                      ),
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
