import 'package:flutter/material.dart';
import '../models/joke.dart';
import '../services/api_services.dart';
import '../widgets/joke_card.dart';

class JokeListScreen extends StatelessWidget {
  final String type;

  JokeListScreen({required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$type Jokes')),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/comedy_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder<List<Joke>>(
          future: ApiServices.getJokesByType(type),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final jokes = snapshot.data!;
              return ListView.builder(
                itemCount: jokes.length,
                itemBuilder: (context, index) {
                  final joke = jokes[index];
                  return JokeCard(joke: joke);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
