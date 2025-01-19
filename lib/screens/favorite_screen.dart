import 'package:flutter/material.dart';
import '../services/favorites_service.dart';
import '../widgets/joke_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = FavoritesService.getFavorites();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorites'),
      ),
      body: favorites.isEmpty
          ? const Center(
        child: Text(
          'No favorites yet!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      )
          : ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final joke = favorites[index];
          return JokeCard(
            joke: joke,
            onTap: () {
              // Optional: Display the joke in more detail
            },
          );
        },
      ),
    );
  }
}
