import 'package:flutter/material.dart';
import 'package:mov/constants/AppContants.dart';
import 'package:mov/constants/AppTexts.dart';
import 'package:mov/screens/FilmMainScreen.dart';

void main() => runApp(MoviesApp());

class MoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: standardRed,
          fontFamily: 'LouisG',
          accentColor: standardRed),
      title: AppTexts.FILMSEARCH,
      home: FilmMainScreen(),
    );
  }
}
