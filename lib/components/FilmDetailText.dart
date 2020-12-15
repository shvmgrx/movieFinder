import 'package:flutter/material.dart';
import 'package:mov/constants/AppStyles.dart';

class FilmDetailText extends StatelessWidget {
  final String text;

  FilmDetailText(this.text);

  @override
  Widget build(BuildContext contex) {
    return Padding(
        child: Text(
          this.text,
          style: AppStyles.body,
        ),
        padding: EdgeInsets.only(top: 8, bottom: 5));
  }
}
