import 'package:flutter/cupertino.dart';

class FoodCart {
  String foodImage;
  double foodPrice;
  String foodType;
  int foodQuantity;
  String foodName;
  FoodCart(
      {@required this.foodImage,
      @required this.foodName,
      @required this.foodPrice,
      @required this.foodQuantity,
      @required this.foodType});
}
