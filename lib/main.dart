import 'package:flutter/material.dart';
import 'models/diary_entry.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

void main() => runApp(const DiaryApp());

class DiaryApp extends StatefulWidget {
  const DiaryApp({super.key});

  @override
  State<DiaryApp> createState() => _DiaryAppState();
}

class _DiaryAppState extends State<DiaryApp> {
  bool _darkMode = false;
  bool _loggedIn = false;
  final List<DiaryEntry> _entries = [];

  void _toggleTheme() => setState(() => _darkMode = !_darkMode);
  void _login() => setState(() => _loggedIn = true);
  void _addEntry(DiaryEntry e) => setState(() => _entries.add(e));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Diary',
      debugShowCheckedModeBanner: false,
      theme: _darkMode
          ? ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(primary: Colors.purpleAccent.shade100),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purpleAccent),
              ),
            )
          : ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(primary: Colors.deepPurple),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple, foregroundColor: Colors.white),
              ),
            ),
      home: _loggedIn
          ? HomeScreen(
              toggleTheme: _toggleTheme,
              entries: _entries,
              onAdd: _addEntry,
              darkMode: _darkMode,
            )
          : LoginScreen(onLogin: _login),
    );
  }
}
