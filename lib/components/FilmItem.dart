import 'package:flutter/material.dart';
import 'package:mov/constants/AppStyles.dart';
import 'package:mov/constants/AppTexts.dart';
import 'package:mov/models/Film.dart' as models;

class FilmItem extends StatelessWidget {
  final models.Film film;

  FilmItem({this.film});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyles.boxDecor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(children: <Widget>[
            (this.film.poster != "N/A")
                ? Image.network(this.film.poster, height: 100, width: 100)
                : Image.network(AppTexts.NOIMAGE, height: 100, width: 100)
          ]),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      this.film.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: AppStyles.movieName,
                    ),
                  ),
                  Text(
                    this.film.year,
                    style: AppStyles.subheading,
                  ),
                  Text(this.film.type)
                ]),
          )
        ],
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 25, left: 5, right: 10),
    );
  }
}
