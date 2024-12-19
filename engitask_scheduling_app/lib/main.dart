import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/loginpage.dart';
import 'screens/addschedulepage.dart';
import 'screens/settingpage.dart';
import 'screens/agendapage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const EngiTaskApp());
}

class EngiTaskApp extends StatelessWidget {
  const EngiTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EngiTask',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.purple[700],
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
          elevation: 0,
        ),
        cardTheme: CardTheme(
          color: Colors.grey[850],
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.grey[900],
          selectedItemColor: Colors.purple[200],
          unselectedItemColor: Colors.grey[400],
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple[700],
            foregroundColor: Colors.white,
          ),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/agenda': (context) => const AgendaPage(),
        '/add-schedule': (context) => const AddSchedulePage(),
        '/settings': (context) => const SettingsPage(),
      },
    );
  }
}