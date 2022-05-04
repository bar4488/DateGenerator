import 'package:date_generator/src/models/Weekday.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class SettingsService {
  late SharedPreferences _preferences;

  SettingsService() {}

  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode> themeMode() async {
    int? index = _preferences.getInt("theme");
    if (index != null) {
      return ThemeMode.values[index];
    }
    return ThemeMode.system;
  }

  Future<WeekDay> startWeekDay() async {
    int? index = _preferences.getInt("theme");
    if (index != null) {
      return WeekDay.values[index];
    }
    return WeekDay.sunday;
  }

  int? maxComboFastest() => _preferences.getInt("maxComboFastest");
  int? maxComboZen() => _preferences.getInt("maxComboZen");
  int? avarageDPM() => _preferences.getInt("avarageDPM");
  int? maxFastestInMinutes(int minutes) =>
      _preferences.getInt("maxDatesIn$minutes");

  void updateMaxComboFastest(int val) {
    _preferences.setInt("maxComboFastest", val);
  }

  void updateMaxComboZen(int val) => _preferences.setInt("maxComboZen", val);
  void updateAvarageDPM(int val) => _preferences.setInt("avarageDPM", val);
  void updateMaxFastestInMinutes(int minutes, int val) =>
      _preferences.setInt("maxDatesIn$minutes", val);

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode theme) async {
    _preferences.setInt("theme", theme.index);
  }

  Future<void> updateStartDay(WeekDay day) async {
    _preferences.setInt("startDay", day.index);
  }

  Future<void> initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }
}
