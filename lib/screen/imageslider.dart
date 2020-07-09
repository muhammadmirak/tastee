import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import './login.dart';
import '../widget/my_button.dart';

class ImageSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Carousel(
          boxFit: BoxFit.cover,
          autoplay: true,
          animationDuration: Duration(seconds: 2),
          dotSize: 10.0,
          dotIncreasedColor: Theme.of(context).primaryColor,
          dotBgColor: Colors.transparent,
          dotPosition: DotPosition.bottomCenter,
          showIndicator: true,
          images: [
            AssetImage("image/Foods.jpg"),
            AssetImage("image/made.jpg"),
            AssetImage("image/cheese.jpg"),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Center(
                child: MyButton(
                  // color1: Color(0xffffffff),
                  // color: Color(0xfffe257e),
                  text: "Skip",
                  whenpress: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => Login(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
