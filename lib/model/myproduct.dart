import 'package:flutter/material.dart';

class MyProduct {
  final String foodName;
  final String foodTitle;
  final int foodPrice;
  
  MyProduct(
      {@required this.foodName,
      @required this.foodPrice,
      @required this.foodTitle});
}