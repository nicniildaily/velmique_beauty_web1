import 'package:flutter_test/flutter_test.dart';
import 'package:velmique_beauty_web1/main.dart';

void main() {
  testWidgets('App loads correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const VelmiqueApp());
    await tester.pumpAndSettle();
    expect(find.text('Velmique Beauty'), findsAny);
  });
}