import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/views/home_view.dart';

void main() {
  // Required so rootBundle can load JSON assets during widget tests
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('HomeView loads and displays movies from JSON asset',
      (WidgetTester tester) async {
    // 1. Build the HomeView widget
    await tester.pumpWidget(
      const MaterialApp(
        home: HomeView(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Howls Moving Castle'), findsOneWidget);
    expect(find.text('Spirited Away'), findsOneWidget);
  });
}