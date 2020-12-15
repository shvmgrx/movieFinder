import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mov/models/Film.dart';
import 'package:mov/models/FilmInfo.dart';

const API_KEY = "40ede646";
const API_URL = "http://www.omdbapi.com/?apikey=";
Future<List<Film>> searchFilms(keyword) async {
  final response = await http.get('$API_URL$API_KEY&s=$keyword');

  if (response.statusCode == 200) {
    Map data = json.decode(response.body);

    if (data['Response'] == "True") {
      var list = (data['Search'] as List)
          .map((item) => new Film.fromJson(item))
          .toList();
      return list;
    } else {
      throw Exception(data['Error']);
    }
  } else {
    throw Exception('Something went wrong !');
  }
}

Future<FilmInfo> getFilm(filmId) async {
  final response = await http.get('$API_URL$API_KEY&i=$filmId');

  if (response.statusCode == 200) {
    Map data = json.decode(response.body);

    if (data['Response'] == "True") {
      return FilmInfo.fromJSON(data);
    } else {
      throw Exception(data['Error']);
    }
  } else {
    throw Exception('Something went wrong !');
  }
}
