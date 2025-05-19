import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:daily_quote_app/main.dart';

void main() {
  testWidgets('Quote screen loads and buttons are present',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const DailyQuoteApp());

    // Verify the quote text is shown.
    expect(find.byType(Text), findsWidgets);

    // Verify the buttons are present.
    expect(find.byIcon(Icons.refresh), findsOneWidget);
    expect(find.byIcon(Icons.copy), findsOneWidget);
    expect(find.byIcon(Icons.share), findsOneWidget);
  });
}
