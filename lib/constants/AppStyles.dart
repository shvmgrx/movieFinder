import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:mov/constants/AppContants.dart';

class AppStyles {
  static final TextStyle heading = TextStyle(
    fontSize: 35,
    color: standardWhite,
    fontFamily: 'Coolvetica',
  );

  static final TextStyle subheading = TextStyle(
    fontSize: 18,
    color: standardRed,
    fontFamily: 'Coolvetica',
    fontWeight: FontWeight.w500,
  );

  static final TextStyle body = TextStyle(
    fontSize: 18,
    color: grey1,
    fontFamily: 'LouisG',
    fontWeight: FontWeight.w400,
  );

  static final BoxDecoration boxDecor = BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
      color: mC,
      boxShadow: [
        BoxShadow(
          color: mCD,
          offset: Offset(-10, 10),
          blurRadius: 10,
        ),
        BoxShadow(
          color: mCL,
          offset: Offset(0, -10),
          blurRadius: 10,
        ),
      ]);

  static final TextStyle moviePlot = TextStyle(
    fontSize: 18,
    color: standardBlack,
    fontFamily: 'LouisG',
    fontWeight: FontWeight.w400,
  );

  static final TextStyle movieName = TextStyle(
    fontSize: 25,
    color: standardBlack,
    fontFamily: 'Coolvetica',
  );
}
