class ResetPasswordModel {
  String? oldPassword;
  String? newPassword;
  String? message;
  String? error;
  int? statusCode;
  dynamic data;

  ResetPasswordModel.request({
    required this.oldPassword,
    required this.newPassword,
  });

  ResetPasswordModel.response({
    this.message,
    this.error,
    this.statusCode,
    this.data,
  });

  Map<String, dynamic> toJson() {
    return {'oldPassword': oldPassword, 'newPassword': newPassword};
  }

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    String? msg;
    String? err;

    if (json['message'] is List) {
      msg = (json['message'] as List).join(" ");
    } else {
      msg = json['message']?.toString();
    }

    if (json['error'] is List) {
      err = (json['error'] as List).join(" ");
    } else {
      err = json['error']?.toString();
    }

    return ResetPasswordModel.response(
      message: msg,
      error: err,
      statusCode: json['statusCode'],
      data: json['data'],
    );
  }
}
