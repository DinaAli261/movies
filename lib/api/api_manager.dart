import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/api/api_constants.dart';
import 'package:movies/api/end_points.dart';
import 'package:movies/model/LoginResponse.dart';
import 'package:movies/model/RegisterResponse.dart';

import '../model/DeleteProfileResponse.dart';
import '../model/ResetPasswordResponse.dart';
import '../model/UpdateProfileResponse.dart';

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

  static Future<RegisterResponse> register({
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
    return RegisterResponse.fromJson(json);
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

  static Future<UpdateProfileResponse> updateProfile({
    required String name,
    required String phone,
    required int avaterId,
    required String token,
  }) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.updateProfileApi);

    var body = {"name": name, "phone": phone, "avaterId": avaterId};

    var response = await http.patch(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(body),
    );

    var json = jsonDecode(response.body);
    return UpdateProfileResponse.fromJson(json);
  }

  static Future<DeleteProfileResponse> deleteProfile({
    required String token,
  }) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.deleteProfileApi);

    var response = await http.delete(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    var json = jsonDecode(response.body);
    return DeleteProfileResponse.fromJson(json);
  }
}
