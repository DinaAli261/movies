import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/api/api_constants.dart';
import 'package:movies/api/end_points.dart';
import 'package:movies/model/LoginResponse.dart';

import '../model/ResetPasswordResponse.dart';

class ApiManager {
  static Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.loginApi);

    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email, "password": password}),
    );

    var json = jsonDecode(response.body);

    return LoginResponse(
      message: json['message'],
      data: json['data'],
      error: json['error'],
      statusCode: response.statusCode,
    );
  }

  static Future<LoginResponse> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required int avaterId,
  }) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.registerApi);

    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "name": name,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
        "phone": phone,
        "avaterId": avaterId,
      }),
    );

    var json = jsonDecode(response.body);
    return LoginResponse.fromJson(json);
  }

  static Future<ResetPasswordModel> resetPassword({
    required String oldPassword,
    required String newPassword,
    required String token,
  }) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.resetPasswordApi);

    var requestBody = ResetPasswordModel.request(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );

    var response = await http.patch(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(requestBody.toJson()),
    );

    var json = jsonDecode(response.body);
    return ResetPasswordModel.fromJson(json);
  }
}
