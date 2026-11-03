import 'package:flutter_test/flutter_test.dart';

import 'package:smartkasir_app/main.dart';

void main() {
  testWidgets('SmartKasirApp smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SmartKasirApp());

    // Verify that SmartKasir title is displayed.
    expect(find.text('SmartKasir'), findsWidgets);
  });
}
