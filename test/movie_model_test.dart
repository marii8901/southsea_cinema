import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie model tests', () {
    test('creates Movie instance and formats price correctly', () {
      const movie = Movie(
        id: 'howl',
        title: 'Howls Moving Castle',
        synopsis: 'A young milliner is turned into an elderly woman...',
        ageRating: 'PG',
        price: 7.5,
        imagePath: 'assets/images/howl.jpg',
        screeningTime: 'Sunday 4 Oct 2026 15:00',
      );

      expect(movie.title, 'Howls Moving Castle');
      expect(movie.formattedPrice, '£7.50');
    });
  });

  test('Movie.fromJson converts map to Movie correctly and toJson returns matching map', () {
      final Map<String, dynamic> movieMap = <String, dynamic>{
        'id': 'movie_1',
        'title': 'Howls Moving Castle',
        'synopsis': 'A magical tale',
        'ageRating': 'PG',
        'screeningTime': '15:00',
        'price': 7.50,
        'imagePath': 'assets/images/howl.jpg',
      };

      final Movie movie = Movie.fromJson(movieMap);

      expect(movie.id, 'movie_1');
      expect(movie.title, 'Howls Moving Castle');
      expect(movie.price, 7.50);
      expect(movie.toJson(), movieMap);
    });

    test('Movie.fromJson handles whole-number prices by converting to double', () {
      final Map<String, dynamic> movieMap = <String, dynamic>{
        'id': 'movie_2',
        'title': 'Spirited Away',
        'synopsis': 'A journey into spirit world',
        'ageRating': 'PG',
        'screeningTime': '18:00',
        'price': 7, // Whole-number integer price
        'imagePath': 'assets/images/spirited.jpg',
      };

      final Movie movie = Movie.fromJson(movieMap);

      expect(movie.price, isA<double>());
      expect(movie.price, 7.0);
    });
}
