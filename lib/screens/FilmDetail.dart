import 'package:flutter/material.dart';
import 'package:mov/constants/AppStyles.dart';
import 'package:mov/constants/AppTexts.dart';
import 'package:mov/services/filmFetch.dart';
import 'package:mov/models/FilmInfo.dart';
import 'package:mov/components/FilmDetailText.dart';

class FilmDetail extends StatelessWidget {
  final String movieName;
  final String imdbId;

  FilmDetail({this.movieName, this.imdbId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.movieName,
          style: AppStyles.heading,
        ),
      ),
      body: FutureBuilder<FilmInfo>(
          future: getFilm(this.imdbId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            alignment: Alignment.center,
                            child: Image.network(
                              snapshot.data.poster,
                              width: 200,
                            ),
                          ),
                          Container(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 18.0),
                                      child: Text(
                                        snapshot.data.plot,
                                        textAlign: TextAlign.justify,
                                        style: AppStyles.moviePlot,
                                      ),
                                    ),
                                    FilmDetailText(
                                        AppTexts.YEAR + snapshot.data.year),
                                    FilmDetailText(
                                        AppTexts.GENRE + snapshot.data.genre),
                                    FilmDetailText(AppTexts.DIRECTOR +
                                        snapshot.data.director),
                                    FilmDetailText(AppTexts.RUNTIME +
                                        snapshot.data.runtime),
                                    FilmDetailText(
                                        AppTexts.RATED + snapshot.data.rating),
                                    FilmDetailText(AppTexts.IMDB_RATING +
                                        snapshot.data.imdbRating),
                                    FilmDetailText(AppTexts.META +
                                        snapshot.data.metaScore),
                                  ],
                                ),
                              ),
                              decoration: AppStyles.boxDecor),
                        ])),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
