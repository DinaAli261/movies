import 'package:shared_preferences/shared_preferences.dart';

const String _languageKey = "current_language";
//بنحفظ اخر لغه استخدمناها
Future<void> saveLastLang(String languageCode) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(_languageKey, languageCode);
}

// بنرجع اخر لغه حفظناها
Future<String> getLastLang() async {
  final prefs = await SharedPreferences.getInstance();
  //لو ملقاش حاجه محفوظه يرجع en
  return prefs.getString(_languageKey) ?? "en";
}
