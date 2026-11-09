import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie>? _cachedMovies;

  Future<List<Movie>> loadMoviesFromAsset({
    String assetPath = 'assets/data/movies.json',
  }) async {
    final String jsonString = await rootBundle.loadString(assetPath);
    final dynamic decodedData = jsonDecode(jsonString);
    final List<dynamic> jsonList = decodedData as List<dynamic>;
    final List<Movie> loadedMovies = [];

    for (final dynamic item in jsonList) {
      final Map<String, dynamic> itemMap = item as Map<String, dynamic>;
      loadedMovies.add(Movie.fromJson(itemMap));
    }

    _cachedMovies = loadedMovies;
    return loadedMovies;
  }

  // ADD THIS CACHE CHECK HERE:
  List<Movie> getMovies() {
    final List<Movie>? cachedMovies = _cachedMovies;
    if (cachedMovies != null) {
      return cachedMovies;
    }
    return [
      const Movie(
        id: 'howl',
        title: 'Howls Moving Castle',
        synopsis: 'A young milliner is turned into an elderly woman...',
        ageRating: 'PG',
        screeningTime: 'Sunday 4 Oct 2026 15:00',
        price: 7.50,
        imagePath: 'assets/images/howl.jpg',
      ),
      const Movie(
        id: 'spirited',
        title: 'Spirited Away',
        synopsis: 'During her family\'s move to the suburbs...',
        ageRating: 'PG',
        screeningTime: 'Thursday 8 Oct 2026 18:00',
        price: 7.50,
        imagePath: 'assets/images/spirited.jpg',
      ),
    ];
  }

  Movie? getMovieById(String id) {
    for (final movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }
    return null;
  }
}
