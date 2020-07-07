import 'package:flutter/material.dart';

import '../widget/my_button.dart';
import './profile_screen.dart';
import 'package:provider/provider.dart';
import '../provider/food_provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  FoodProvider provider;
  double totolPrice = 0.0;
  @override
  void initState() {
    super.initState();
    FoodProvider provider = Provider.of<FoodProvider>(context, listen: false);
    var getTotalPrice = provider.allFoodCarts;

    getTotalPrice.forEach((element) {
      totolPrice += element.foodPrice;
    });
  }

  Widget _buildContainer(BuildContext context, int index) {
    var allFoodCart = provider.allFoodCart;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 80,
      color: Color(0xffffffff),
      width: double.infinity,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          CircleAvatar(
            maxRadius: 40,
            backgroundImage: NetworkImage(allFoodCart[index].foodImage),
          ),
          Text(
            "${allFoodCart[index].foodQuantity}x",
            style: TextStyle(fontSize: 25, color: Color(0xffd1d6d8)),
          ),
          Container(
            height: 50,
            child: Column(
              children: <Widget>[
                Text(
                  allFoodCart[index].foodName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  allFoodCart[index].foodType,
                  style: TextStyle(fontSize: 20, color: Color(0xffd1d6d8)),
                ),
              ],
            ),
          ),
          Text(
            "\$ ${allFoodCart[index].foodPrice}",
            style: TextStyle(
                fontSize: 25,
                color: Color(0xff01d4ee),
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget _buildColumn() {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Total",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text("\$$totolPrice",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ],
          ),
        ),
        MyButton(
          color1: Color(0xffff3fa6),
          color: Color(0xffffffff),
          text: "Submint",
          whenpress: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => ProfileScreen()),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<FoodProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff7f8f8),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          elevation: 0.0,
          title: Center(
              child: Text(
            "Cart",
            style: TextStyle(
              color: Colors.black,
            ),
          )),
          backgroundColor: Color(0xfff7f8f8),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xfff7f8f8),
                      ),
                      child: ListView.builder(
                        itemBuilder: _buildContainer,
                        itemCount: provider.foodCartList,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Color(0xffff3ea5),
                      child: _buildColumn(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
