import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart'; // Make sure your main app is imported

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Basic app loading test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SouthseaCinemaApp()); // Or MyApp(), depending on your main.dart

    // Wait for the asynchronous movie loading to complete
    await tester.pumpAndSettle();

    // Verify that movies load
    expect(find.text('Howls Moving Castle'), findsOneWidget);
  });
}