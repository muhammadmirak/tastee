import 'package:flutter/material.dart';
// import 'package:testee/screen/imageslider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:testee/provider/food_provider.dart';
import 'package:testee/screen/home_screen.dart';
import 'package:testee/screen/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FoodProvider(),
      child: MaterialApp(
          home: StreamBuilder(
              stream: FirebaseAuth.instance.onAuthStateChanged,
              builder: (ctx, userSanpshot) {
                if (userSanpshot.hasData) {
                  return HomeScreen();
                }
                return Login();
              })
          // ImageSlider(),
          ),
    );
  }
}
