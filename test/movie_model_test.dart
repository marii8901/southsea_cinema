import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie model tests', () {
    test('creates Movie instance and formats price correctly', () {
      const movie = Movie(
        id: 'test-id',
        title: 'Test Movie',
        synopsis: 'A test film synopsis.',
        ageRating: '12A',
        price: 7.5,
        imagePath: 'assets/images/phantom.jpeg',
        screeningTime: 'Sunday 4 Oct 2026 15:00',
      );

      expect(movie.title, 'Test Movie');
      expect(movie.formattedPrice, '£7.50');
    });
  });
}