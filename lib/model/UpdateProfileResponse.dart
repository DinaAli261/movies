class UpdateProfileResponse {
  String? message;

  UpdateProfileResponse({this.message});

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) {
    return UpdateProfileResponse(message: json['message']?.toString());
  }

  Map<String, dynamic> toJson({
    String? email,
    String? name,
    String? phone,
    int? avaterId,
  }) {
    final map = <String, dynamic>{};
    if (email != null) map['email'] = email;
    if (name != null) map['name'] = name;
    if (phone != null) map['phone'] = phone;
    if (avaterId != null) map['avaterId'] = avaterId;
    return map;
  }
}
