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
}