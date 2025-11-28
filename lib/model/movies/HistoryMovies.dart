class HistoryMovie {
  final int id;
  final String title;
  final String posterPath;
  final String date;
  final double rating;

  HistoryMovie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.date,
    this.rating = 0.0,
  });

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "posterPath": posterPath,
    "date": date,
  };

  factory HistoryMovie.fromJson(Map<String, dynamic> json) {
    return HistoryMovie(
      id: json["id"],
      title: json["title"],
      posterPath: json["posterPath"],
      date: json["date"],
    );
  }
}
