import 'package:flutter_test/flutter_test.dart';
import 'package:os_ulas_admin_panel/export.dart';

void main() {
  group('MetricCard Widget Test', () {
    testWidgets('renders all expected values correctly', (tester) async {
      /// Testte kullanılacak sabit metin ve sayılar.
      final testTitle = 'Toplam Kullanıcı';
      final testDescription = 'Düne göre artış';
      final testTotalCount = 123.45;
      final testPercentChange = 8.9;
      final iconBackgroundColor = Colors.red;

      ///  Sahte bir görsel (Image.memory ile boş veri).
      final iconImage = Image.memory(
        Uint8List(0),
        errorBuilder: (_, _, _) => const SizedBox(),
      );

      /// MetricCard widget'ını MaterialApp ve Scaffold içinde
      /// sarıp test ortamına eklenir
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MetricCard(
              title: testTitle,
              description: testDescription,
              iconImage: iconImage,
              iconBackgroundColor: iconBackgroundColor,
              totalCount: testTotalCount,
              percentChange: testPercentChange,
            ),
          ),
        ),
      );

      ///  Animasyon ve async işlemler bitene kadar bekle
      await tester.pumpAndSettle();

      ///  Beklenen UI elementlerini test edilir
      ///
      /// Başlık metni doğru mu?
      expect(find.text(testTitle), findsOneWidget);

      /// Toplam sayı doğru mu?
      expect(find.text(testTotalCount.toString()), findsOneWidget);

      /// Yüzdelik değişim doğru mu?
      expect(find.text('%$testPercentChange'), findsOneWidget);

      /// Açıklama doğru görünüyor mu?
      expect(find.text(' $testDescription'), findsOneWidget);

      /// Verilen iconImage widget'ı görünür mü? (Key ile test)
      expect(find.byKey(const Key('metric_icon_image')), findsOneWidget);

      /// Sabit olarak MetricCard içinde kullanılan trending icon görünüyor mu?
      /// (Key ile test)
      expect(find.byKey(const Key('metric_trending_icon')), findsOneWidget);
    });
  });
}
