import 'package:flutter_test/flutter_test.dart';
import 'package:re_food/main.dart';

void main() {
  testWidgets('Re-Food app smoke test', (WidgetTester tester) async {
    // Menjalankan aplikasi Re-Food
    await tester.pumpWidget(const ReFoodApp());

    // Memastikan aplikasi berhasil ditampilkan
    expect(find.text('Re-Food'), findsOneWidget);
  });
}
