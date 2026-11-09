import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('MovieRepository tests', () {
    test('checks repository has movies', () {
      final repo = MovieRepository();
      expect(repo.getMovies().length, 2);
    });

    test('finds movie by correct id', () {
      final repo = MovieRepository();
      final movie = repo.getMovieById('howl');
      expect(movie, isNotNull);
      expect(movie?.title, 'Howls Moving Castle');
    });

    test('returns null for fake id', () {
      final repo = MovieRepository();
      final movie = repo.getMovieById('wrong-id');
      expect(movie, isNull);
    });
      
    test('loadMoviesFromAsset reads the bundled JSON catalogue', () async {
      final repo = MovieRepository();
      final List<Movie> movies = await repo.loadMoviesFromAsset();

      expect(movies.length, 2);
      expect(movies[0].id, 'movie_1');
      expect(movies[0].title, 'Howls Moving Castle');
      expect(movies[1].id, 'movie_2');
      expect(movies[1].title, 'Spirited Away');

      // Checks that getMovies() now returns the cached asset list
      expect(repo.getMovies(), movies);
    });
  });
}