import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/api/api_constants.dart';
import 'package:movies/api/end_points.dart';
import 'package:movies/model/movies/movies_details_response.dart';

class MovieDetailsApiManager {
  static Future<MoviesDetails> getMovieDetails({required int moviesId}) async {
    Uri url = Uri.https(
      ApiConstants.moviesBaseUrl,
      EndPoints.detailsApi,
      {
        'movie_id': moviesId.toString(),
        'with_image':'true',
        'with_cast': 'true'
      },
    );

    try {
      final response = await http.get(url);
      final json = jsonDecode(response.body);
      return MoviesDetails.fromJson(json);

    } catch (e) {
      print("ERROR: $e");
      rethrow;
    }
  }

}