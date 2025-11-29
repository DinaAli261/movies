import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movies/model/movies/WatchListMovies.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WatchListProvider with ChangeNotifier {
  List<Watchlistmovies> _watchList = [];
  String? _userId;

  List<Watchlistmovies> get watchList => _watchList;

  void setUserId(String userId) {
    _userId = userId;
  }

  Future<void> loadWatchList(String userId) async {
    _userId = userId;

    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString("WatchList_$userId");

    if (jsonString != null) {
      final decoded = jsonDecode(jsonString);
      _watchList = decoded
          .map<Watchlistmovies>((movie) => Watchlistmovies.fromJson(movie))
          .toList();
    } else {
      _watchList = [];
    }

    notifyListeners();
  }

  Future<void> _saveWatchList() async {
    if (_userId == null) return;

    final prefs = await SharedPreferences.getInstance();
    final watchListJson = _watchList.map((m) => m.toJson()).toList();

    prefs.setString("WatchList_$_userId", jsonEncode(watchListJson));
  }

  void addTowatchList(Watchlistmovies movie) {
    _watchList.removeWhere((m) => m.id == movie.id);

    _watchList.insert(0, movie);

    _saveWatchList();
    notifyListeners();
  }

  Future<void> clearWatchList() async {
    _watchList.clear();
    if (_userId != null) {
      final prefs = await SharedPreferences.getInstance();
      prefs.remove("WatchList_$_userId");
    }
    notifyListeners();
  }
}
