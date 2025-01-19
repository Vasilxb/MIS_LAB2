import 'package:flutter/material.dart';
import '../models/joke.dart';
import '../services/favorites_service.dart';

class JokeCard extends StatefulWidget {
  final Joke joke;
  final VoidCallback? onTap;

  const JokeCard({
    super.key,
    required this.joke,
    this.onTap,
  });

  @override
  State<JokeCard> createState() => _JokeCardState();
}

class _JokeCardState extends State<JokeCard> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = FavoritesService.isFavorite(widget.joke);
  }

  void toggleFavorite() {
    setState(() {
      FavoritesService.toggleFavorite(widget.joke);
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: widget.onTap,
        title: Text(widget.joke.setup),
        subtitle: Text(widget.joke.punchline),
        trailing: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : null,
          ),
          onPressed: toggleFavorite,
        ),
      ),
    );
  }
}
