import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  late ThemeData _themeData;

  ThemeData get themeData => _themeData;

  ThemeProvider() {
    // Set the initial theme from SharedPreferences or use a default theme
    _loadTheme();
  }

  // Load theme from SharedPreferences
  _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _themeData = isDarkMode ? _darkTheme : _lightTheme;
    notifyListeners();
  }

  // Toggle between dark and light themes and save the preference to SharedPreferences
  toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
    prefs.setBool('isDarkMode', !isDarkMode);
    _themeData = !isDarkMode ? _darkTheme : _lightTheme;
    notifyListeners();
  }

  // Define your light and dark themes
  final ThemeData _lightTheme = ThemeData(
    // Light theme settings
    brightness: Brightness.light,
    // Add other light theme properties as needed
  );

  final ThemeData _darkTheme = ThemeData(
    // Dark theme settings
    brightness: Brightness.dark,
    // Add other dark theme properties as needed
  );
}
