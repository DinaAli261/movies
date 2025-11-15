import 'dart:convert';

import 'package:http/http.dart' as http;

import 'movies/movie_response.dart';

class MovieApiManager{
  static const String baseUrl = 'https://yts.mx/api/v2';

  Future<MovieResponse> getMovies({
    int page = 1,
    String quality = 'All',
    String genre = '',
  }) async {
    final response = await http.get(
      Uri.parse(
        '$baseUrl/list_movies.json?page=$page&quality=$quality${genre.isNotEmpty ? '&genre=$genre' : ''}',
      ),
    );

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movies');
    }
  }

  // You can add more methods for searching, etc.
  Future<MovieResponse> searchMovies(String query, {int page = 1}) async {
    final response = await http.get(
      Uri.parse('$baseUrl/list_movies.json?query_term=$query&page=$page'),
    );

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to search movies');
    }
  }
}