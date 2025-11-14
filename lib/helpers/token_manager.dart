import 'package:shared_preferences/shared_preferences.dart';

class UserManager {
  // ======== Token ========
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userToken', token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userToken');
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userToken');
  }

  // ======== User Data ========
  static Future<void> saveUserData({
    required String name,
    required String email,
    required String phone,
    int? avaterId,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
    await prefs.setString('userEmail', email);
    await prefs.setString('userPhone', phone);
    if (avaterId != null) {
      await prefs.setInt('userAvaterId', avaterId);
    }
  }

  static Future<Map<String, dynamic>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'name': prefs.getString('userName') ?? '',
      'email': prefs.getString('userEmail') ?? '',
      'phone': prefs.getString('userPhone') ?? '',
      'avaterId': prefs.getInt('userAvaterId') ?? 0,
    };
  }

  static Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userName');
  }

  static Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userName');
    await prefs.remove('userEmail');
    await prefs.remove('userPhone');
    await prefs.remove('userAvaterId');
    await prefs.remove('userToken');
  }
}
