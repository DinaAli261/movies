class RegisterResponse {
  String? message;
  String? error;
  int? statusCode;
  dynamic data;

  RegisterResponse.fromJson(Map<String, dynamic> json) {
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

    statusCode = json['statusCode'];
    data = json['data'];
  }
}
