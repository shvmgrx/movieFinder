import 'package:flutter/material.dart';
import 'package:mov/components/FilmItem.dart';
import 'package:mov/models/Film.dart';

class FilmList extends StatelessWidget {
  final List<Film> movies;
  final Function itemClick;

  FilmList({this.movies, this.itemClick});

  @override
  Widget build(context) {
    return new Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: this.movies.length,
            itemBuilder: (BuildContext context, int index) {
              return new GestureDetector(
                  child: FilmItem(film: this.movies[index]),
                  onTap: () => this.itemClick(this.movies[index]));
            }));
  }
}
