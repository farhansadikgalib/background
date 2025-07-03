import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:background/background.dart';

void main() {
  testWidgets('Background displays child widget', (WidgetTester tester) async {
    // Use a fake image path for testing
    const testImagePath = 'assets/test_image.png';

    await tester.pumpWidget(
      MaterialApp(
        home: Background(path: testImagePath, child: const Text('Hello World')),
      ),
    );

    // Verify the child widget is present
    expect(find.text('Hello World'), findsOneWidget);
  });
}
