import 'package:flutter/material.dart';
import '../models/joke.dart';
import '../services/api_services.dart';

class JokeListScreen extends StatelessWidget {
  final String type;

  JokeListScreen({required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$type Jokes')),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/comedy_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder<List<Joke>>(
          future: ApiServices.getJokesByType(type),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final jokes = snapshot.data!;
              return ListView.builder(
                itemCount: jokes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Text(
                        jokes[index].setup,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    subtitle: Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Text(
                        jokes[index].punchline,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
