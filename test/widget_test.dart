import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/views/home_view.dart';

void main() {
  testWidgets('Basic app loading test', (WidgetTester tester) async {
    await tester.pumpWidget(const SouthseaCinemaApp());
    expect(find.text('Welcome to Southsea Cinema'), findsOneWidget);
  });

  testWidgets('App displays HomeView and title', (WidgetTester tester) async {
    await tester.pumpWidget(const SouthseaCinemaApp());

    expect(find.byType(HomeView), findsOneWidget);
    expect(find.text('Southsea Cinema'), findsOneWidget);
  });
}
