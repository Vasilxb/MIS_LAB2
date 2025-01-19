import '../models/joke.dart';

class FavoritesService {
  static final List<Joke> _favorites = [];

  static List<Joke> getFavorites() => _favorites;

  static void toggleFavorite(Joke joke) {
    final existingIndex = _favorites.indexWhere((fav) => fav.id == joke.id);
    if (existingIndex != -1) {
      _favorites.removeAt(existingIndex);
    } else {
      joke.toggleFavorite(); // Update the isFavorite flag
      _favorites.add(joke);
    }
  }

  static bool isFavorite(Joke joke) {
    return _favorites.any((fav) => fav.id == joke.id);
  }
}
