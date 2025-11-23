import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/movies/MovieSuggestionResponse.dart';
import 'api_constants.dart';
import 'end_points.dart';

class MoviesApi {
  static Future<MovieSuggestionResponse> getMovieSuggestions({
   required int movieId,
  }) async {
    Uri url = Uri.https(
      ApiConstants.moviesBaseUrl,
      '${ApiConstants.moviesBasePath}${EndPoints.movieSuggestions}',
      {'movie_id': movieId.toString()},
    );

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return MovieSuggestionResponse.fromJson(jsonData);
    } else {
      throw Exception('Failed to load movie suggestions');
    }
  }
}
}
