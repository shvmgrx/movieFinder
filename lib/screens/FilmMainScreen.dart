import 'package:flutter/material.dart';
import 'package:mov/components/FilmList.dart';
import 'package:mov/constants/AppContants.dart';
import 'package:mov/constants/appStyles.dart';
import 'package:mov/constants/appTexts.dart';
import 'package:mov/screens/FilmDetail.dart';
import 'package:mov/services/filmFetch.dart';
import 'package:mov/models/Film.dart';
import 'package:flutter/services.dart';

class FilmMainScreen extends StatefulWidget {
  @override
  FilmMainScreenState createState() => FilmMainScreenState();
}

class FilmMainScreenState extends State<FilmMainScreen> {
  final searchTextController = new TextEditingController();
  String searchText = "";

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  void itemClick(Film item) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FilmDetail(
                movieName: item.title,
                imdbId: item.imdbID,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(AppTexts.FILMSEARCH, style: AppStyles.heading)),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
              child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(children: <Widget>[
                      Flexible(
                        child: TextField(
                            controller: searchTextController,
                            decoration: InputDecoration(
                              hintText: AppTexts.FILMSEARCHTERM,
                            ),
                            style: AppStyles.subheading),
                      ),
                      IconButton(
                        icon: Icon(Icons.search),
                        tooltip: AppTexts.FILMSEARCH,
                        highlightColor: standardRed,
                        onPressed: () {
                          setState(() {
                            searchText = searchTextController.text;
                            SystemChannels.textInput
                                .invokeMethod('TextInput.hide');
                          });
                        },
                      ),
                    ]),
                  ),
                  decoration: AppStyles.boxDecor),
            ),
            (searchText.length > 0)
                ? FutureBuilder<List<Film>>(
                    future: searchFilms(searchText),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Expanded(
                            child: FilmList(
                                movies: snapshot.data,
                                itemClick: this.itemClick));
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    })
                : Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(),
                  ),
          ],
        ));
  }
}
