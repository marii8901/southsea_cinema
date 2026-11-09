import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';

const Movie testMovie1 = Movie(
  id: 'movie_1',
  title: 'Spirited Away',
  synopsis: 'Classic anime film.',
  ageRating: 'PG',
  screeningTime: '18:00',
  price: 10.0,
  imagePath: 'assets/images/spirited.jpeg',
);

const Movie testMovie2 = Movie(
  id: 'movie_2',
  title: 'My Neighbor Totoro',
  synopsis: 'Family anime film.',
  ageRating: 'U',
  screeningTime: '15:00',
  price: 6.0,
  imagePath: 'assets/images/totoro.jpeg',
);

void main() {
  setUp(() {
    BasketRepository.instance.clear();
  });

  group('BasketRepository tests', () {
    test('starts with empty basket and zero totals', () {
      final BasketRepository cart = BasketRepository.instance;
      expect(cart.getItems().length, 0);
      expect(cart.getTotalItems(), 0);
      expect(cart.totalItemCount, 0);
      expect(cart.getSubtotal(), 0.0);
      expect(cart.getTotalDue(), 0.0);
    });

    test('adds items and calculates subtotal correctly', () {
      final BasketRepository cart = BasketRepository.instance;

      cart.addItem(testMovie1);
      cart.addItem(testMovie2);

      expect(cart.getItems().length, 2);
      expect(cart.getTotalItems(), 2);
      expect(cart.totalItemCount, 2);
      expect(cart.getSubtotal(), 16.0);
      expect(cart.getTotalDue(), 16.0);
    });

    test('removes items correctly', () {
      final BasketRepository cart = BasketRepository.instance;

      cart.addItem(testMovie1);
      expect(cart.getItems().length, 1);

      cart.removeItem(0);
      expect(cart.getItems().length, 0);
      expect(cart.getTotalDue(), 0.0);
    });
  });
}
