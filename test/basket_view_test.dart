import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/views/basket_view.dart';

const Movie testMovie = Movie(
  id: 'movie_test',
  title: 'Spirited Away',
  synopsis: 'Test movie synopsis.',
  ageRating: 'PG',
  screeningTime: '18:00',
  price: 10.0,
  imagePath: 'assets/images/spirited.jpeg',
);

void main() {
  setUp(() {
    BasketRepository.instance.clear();
  });

  testWidgets('BasketView displays empty message when basket has no items',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: BasketView()));

    expect(find.text('Your basket is empty.'), findsOneWidget);
  });

  testWidgets('BasketView renders items and removes item when delete pressed',
      (WidgetTester tester) async {
    BasketRepository.instance.addItem(testMovie);

    await tester.pumpWidget(const MaterialApp(home: BasketView()));

    expect(find.text('MY ORDER'), findsOneWidget);
    expect(find.text('Spirited Away\n18:00'), findsOneWidget);
    expect(find.text('£10.00'), findsWidgets);

    // Tap the delete icon button
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pump();

    // Verify it returns to the empty state
    expect(find.text('Your basket is empty.'), findsOneWidget);
  });
}
