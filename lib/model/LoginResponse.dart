/// message : "Login success"
/// data : "some_token_or_info"

class LoginResponse {
  String? message;
  dynamic data;
  String? error;
  int? statusCode;

  LoginResponse({this.message, this.data, this.error, this.statusCode});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    if (json['message'] is List) {
      message = (json['message'] as List).join(" ");
    } else {
      message = json['message']?.toString();
    }

    if (json['error'] is List) {
      error = (json['error'] as List).join(" ");
    } else {
      error = json['error']?.toString();
    }

    data = json['data'];
    statusCode = json['statusCode'];
  }
}
