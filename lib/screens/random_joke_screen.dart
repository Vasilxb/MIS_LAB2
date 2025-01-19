import 'package:flutter/material.dart';
import '../models/joke.dart';
import '../services/api_services.dart';
import '../widgets/joke_card.dart';

class RandomJokeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Joke of the Day')),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/comedy_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder<Joke>(
          future: ApiServices.getRandomJoke(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final joke = snapshot.data!;
              return Center(
                child: JokeCard(joke: joke),
              );
            }
          },
        ),
      ),
    );
  }
}
