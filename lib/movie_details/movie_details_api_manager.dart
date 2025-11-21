import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/api/api_constants.dart';
import 'package:movies/api/end_points.dart';
import 'package:movies/model/movies/movies_details_response.dart';

class MovieApiManager {
  static Future<MoviesDetailsResponse> getMovieDetails(int moviesId) async {
    Uri url = Uri.https(ApiConstants.baseUrlDetails, EndPoints.detailsApi, {
      'movie_id': moviesId,
    });
    try {
      var Response = await http.get(url);
      var bodyResponse = Response.body;
      var json = jsonDecode(bodyResponse);
      return MoviesDetailsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
