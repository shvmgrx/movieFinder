class Film {
  final String title;
  final String year;
  final String type;
  final String poster;
  final String imdbID;

  Film({this.title, this.year, this.type, this.poster, this.imdbID});

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
        title: json['Title'],
        year: json['Year'],
        type: json['Type'],
        poster: json['Poster'],
        imdbID: json['imdbID']);
  }
}
