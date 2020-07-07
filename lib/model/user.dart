import 'dart:io';
import 'package:flutter/cupertino.dart';

class User {
  final String userName;
  final String userEmail;
  final int userNumber;
  final String userPassword;
  final String userGender;
  final String userAdders;
  final String image;
  final String userPath; 

  User({
      @required this.userPath,
    @required this.userEmail,
    @required this.userName,
    @required this.userNumber,
    @required this.userPassword,
    @required this.userGender,
    @required this.userAdders,
    @required this.image,
  });
}
