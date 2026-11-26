import 'package:flutter_test/flutter_test.dart';
import 'package:app2_tit1_94/main.dart';

void main() {
  testWidgets('Social Profile UI Smoke Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify AppBar Account ID
    expect(find.text('ปรีชญา แสงอรุณ'), findsOneWidget);

    // Verify Stat counters
    expect(find.text('ผู้ติดตาม'), findsOneWidget);
    expect(find.text('กำลังติดตาม'), findsOneWidget);

    // Verify Buttons
    expect(find.text('ติดตาม'), findsOneWidget);
    expect(find.text('ข้อความ'), findsOneWidget);
  });
}
