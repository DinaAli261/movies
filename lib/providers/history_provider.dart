import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/movies/HistoryMovies.dart';

class HistoryProvider with ChangeNotifier {
  List<HistoryMovie> _history = [];
  String? _userId;

  List<HistoryMovie> get history => _history;

  void setUserId(String userId) {
    _userId = userId;
  }

  Future<void> loadHistory(String userId) async {
    _userId = userId;

    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString("history_$userId");

    if (jsonString != null) {
      final decoded = jsonDecode(jsonString);
      _history = decoded
          .map<HistoryMovie>((movie) => HistoryMovie.fromJson(movie))
          .toList();
    } else {
      _history = [];
    }

    notifyListeners();
  }

  Future<void> _saveHistory() async {
    if (_userId == null) return;

    final prefs = await SharedPreferences.getInstance();
    final historyJson = _history.map((m) => m.toJson()).toList();

    prefs.setString("history_$_userId", jsonEncode(historyJson));
  }

  void addToHistory(HistoryMovie movie) {
    _history.removeWhere((m) => m.id == movie.id);

    _history.insert(0, movie);

    _saveHistory();
    notifyListeners();
  }

  Future<void> clearHistory() async {
    _history.clear();
    if (_userId != null) {
      final prefs = await SharedPreferences.getInstance();
      prefs.remove("history_$_userId");
    }
    notifyListeners();
  }
}
