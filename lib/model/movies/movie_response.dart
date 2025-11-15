// models/movie_model.dart
class MovieResponse {
  final String status;
  final String statusMessage;
  final MovieData data;

  MovieResponse({
    required this.status,
    required this.statusMessage,
    required this.data,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
      status: json['status'],
      statusMessage: json['status_message'],
      data: MovieData.fromJson(json['data']),
    );
  }
}

class MovieData {
  final int movieCount;
  final int limit;
  final int pageNumber;
  final List<Movie> movies;

  MovieData({
    required this.movieCount,
    required this.limit,
    required this.pageNumber,
    required this.movies,
  });

  factory MovieData.fromJson(Map<String, dynamic> json) {
    var moviesList = json['movies'] as List? ?? [];
    return MovieData(
      movieCount: json['movie_count'] ?? 0,
      limit: json['limit'] ?? 20,
      pageNumber: json['page_number'] ?? 1,
      movies: moviesList.map((movie) => Movie.fromJson(movie)).toList(),
    );
  }
}

class Movie {
  final int id;
  final String title;
  final String titleEnglish;
  final int year;
  final double rating;
  final String mediumCoverImage;
  final String largeCoverImage;
  final List<String> genres;
  final int runtime;

  Movie({
    required this.id,
    required this.title,
    required this.titleEnglish,
    required this.year,
    required this.rating,
    required this.mediumCoverImage,
    required this.largeCoverImage,
    required this.genres,
    required this.runtime,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      titleEnglish: json['title_english'] ?? '',
      year: json['year'] ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      mediumCoverImage: json['medium_cover_image'] ?? '',
      largeCoverImage: json['large_cover_image'] ?? '',
      genres: List<String>.from(json['genres'] ?? []),
      runtime: json['runtime'] ?? 0,
    );
  }
}
