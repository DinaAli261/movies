class DeleteProfileResponse {
  String? message;

  DeleteProfileResponse({this.message});

  factory DeleteProfileResponse.fromJson(Map<String, dynamic> json) {
    return DeleteProfileResponse(message: json['message']?.toString());
  }
}
