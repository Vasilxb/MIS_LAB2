import 'package:flutter/material.dart';
import 'package:mis_lab2/screens/login_screen.dart';
import 'package:mis_lab2/screens/register_screen.dart';
import 'package:mis_lab2/services/auth_service.dart';
import 'screens/favorite_screen.dart';
import 'screens/home_screen.dart';
import 'screens/random_joke_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures all bindings are ready before initialization
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Initializes Firebase with platform-specific options
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joke App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: AuthService.isLoggedIn() ? '/' : '/login',
      routes: {
        '/': (context) => HomeScreen(),
        '/random': (context) => RandomJokeScreen(),
        '/favorites': (context) => const FavoritesScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}

