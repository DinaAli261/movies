class MovieSuggestionResponse {
  List<MovieSuggestion>? movies;
  String? error;

  MovieSuggestionResponse({this.movies, this.error});

  factory MovieSuggestionResponse.fromJson(Map<String, dynamic> json) {
    if (json['status'] != 'ok') {
      return MovieSuggestionResponse(
        movies: null,
        error: json['status_message'] ?? 'Unknown error',
      );
    }
    final moviesJson = json['data']['movies'] as List? ?? [];
    return MovieSuggestionResponse(
      movies: moviesJson.map((e) => MovieSuggestion.fromJson(e)).toList(),
      error: null,
    );
  }
}

class MovieSuggestion {
  int? id;
  String? title;
  String? mediumCoverImage;
  double? rating;

  MovieSuggestion({this.id, this.title, this.mediumCoverImage, this.rating});

  factory MovieSuggestion.fromJson(Map<String, dynamic> json) {
    return MovieSuggestion(
      id: json['id'],
      title: json['title'],
      mediumCoverImage: json['medium_cover_image'],
        rating: (json['rating'] as num?)?.toDouble() ?? 0.0
    );
  }
}

