

import 'package:flutter/cupertino.dart';

class FoodModel {
  final String foodName;
  final double foodPrice;
  final String foodType;
  final String foodImage;
  final double foodRate;
  FoodModel(
      {@required this.foodName,
      @required this.foodPrice,
      @required this.foodType,
      @required this.foodImage,
      @required this.foodRate});
}
