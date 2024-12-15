import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/random_joke_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Random Jokes',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: HomeScreen(),
    routes: {
      '/random': (context) => RandomJokeScreen(),
    },
  ));
}
