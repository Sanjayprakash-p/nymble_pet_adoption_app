import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nymble_pet_adoption/components/card.dart';
import 'package:nymble_pet_adoption/screens/home.dart';

void main() {
  testWidgets('Test home page UI', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    // Verify if the 'Adopt' text is present
    expect(find.text('Adopt'), findsOneWidget);

    // Verify if the search field is present
    expect(find.byType(TextField), findsOneWidget);

    // Verify if the GridView is present
    expect(find.byType(GridView), findsOneWidget);
  });

  testWidgets('Test filtering pets', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    // Verify if initial number of pets is correct
    expect(find.byType(Homecard), findsNWidgets(20));

    // Tap on the search field
    await tester.tap(find.byType(TextField));
    await tester.pump();

    // Enter a search query
    await tester.enterText(find.byType(TextField), 'Dog');
    await tester.pump();

    // Verify if number of filtered pets is correct
    expect(find.byType(Homecard), findsNWidgets(10)); // Assuming 10 pets contain 'Dog' in their name or address
  });

  // You can write more tests to cover other aspects of your UI
}
