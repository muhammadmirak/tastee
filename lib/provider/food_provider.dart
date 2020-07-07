import 'package:flutter/material.dart';
import '../model/cart_food.dart';

class FoodProvider with ChangeNotifier {
  List<FoodCart> _myFoodCart = [];

  FoodCart foodCart;
  void addFoodCart({
    String foodImage,
    double foodPrice,
    String foodType,
    int foodQuantity,
    String foodName,
  }) {
    foodCart = FoodCart(
      foodImage: foodImage,
      foodName: foodName,
      foodPrice: foodPrice,
      foodQuantity: foodQuantity,
      foodType: foodType,
    );
    _myFoodCart.add(foodCart);
  }

  List<FoodCart> get allFoodCart {
    return List.from(_myFoodCart);
  }

  int get foodCartList {
    return _myFoodCart.length;
  }

  List<FoodCart> get allFoodCarts {
    return _myFoodCart;
  }
}
