import 'package:flutter_test/flutter_test.dart';
import 'package:os_ulas_admin_panel/export.dart';

void main() {
  group("Custom Screen Title Widget Test", () {
    /// Testler arasında kullanılan test başlığını tanımlar
    final testTitle = "Dashboard";

    /// Gerekli bağlamı sağlamak için bir MaterialApp ve Scaffold içinde widget'ı oluşturur
    testWidgets("displays the given title text", (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomScreenTitle(title: testTitle),
          ),
        ),
      );

      /// Tüm animasyonların ve zamanlanmış mikro görevlerin tamamlanmasını bekler
      await tester.pumpAndSettle();

      /// Belirtilen başlığa sahip bir Metin bileşeninin bileşen ağacında
      /// tam olarak bir kez bulunduğunu doğrular
      expect(find.text(testTitle), findsOneWidget);

      /// Daha detaylı inceleme için Metin widget örneğini widget ağacından alır
      final textWidget = tester.widget<Text>(find.text(testTitle));

      /// Metin bileşeninin boş olmayan bir stile sahip olduğunu ve varsayılan
      /// temanın uygulandığını doğrular
      expect(textWidget.style, isNotNull);
    });

    testWidgets('displays the given title text with custom style', (
      tester,
    ) async {
      const testTitle = 'Dashboard';
      final customStyle = const TextStyle(color: Colors.red, fontSize: 24);

      /// Stil parametresi aracılığıyla sağlanan özel bir TextStyle ile bileşeni oluşturur
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomScreenTitle(
              title: testTitle,
              style: customStyle,
            ),
          ),
        ),
      );

      /// Tüm animasyonların ve zamanlanmış mikro görevlerin tamamlanmasını bekler
      await tester.pumpAndSettle();

      /// Belirtilen başlığa sahip bir Metin bileşeninin bileşen ağacında
      /// tam olarak bir kez bulunduğunu doğrular
      expect(find.text(testTitle), findsOneWidget);

      /// Uygulanan stili doğrulamak için Metin bileşeni
      final textWidget = tester.widget<Text>(find.text(testTitle));

      /// Stil özelliğinin sağlanan özel TextStyle ile eşleştiğini doğrular
      expect(textWidget.style, equals(customStyle));
    });
  });
}
