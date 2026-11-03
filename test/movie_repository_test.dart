import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
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
  });
}
