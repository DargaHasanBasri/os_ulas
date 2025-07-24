import 'dart:ui';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:os_ulas_admin_panel/viewmodel/sidebar/sidebar_cubit.dart';
import 'package:os_ulas_admin_panel/viewmodel/sidebar/sidebar_state.dart';
import 'package:os_ulas_admin_panel/ui/widgets/layouts/sidebars/components/side_bar_item.dart';

/// SidebarCubit sınıfının mock versiyonu. Gerçek Cubit yerine kullanılır.
/// MockCubit sayesinde Cubit fonksiyonları ve state'leri simüle edilir.
class MockSidebarCubit extends MockCubit<SidebarState>
    implements SidebarCubit {}

/// SidebarState için sahte (fake) state objesi.
class MockSidebarState extends Fake implements SidebarState {}

void main() {
  /// mockSidebarCubit değişkeni, her testte kullanılacak mock Cubit örneği için
  late SidebarCubit mockSidebarCubit;

  /// Tüm testlerden önce 1 kere çalışır.
  /// Mocktail kütüphanesi, parametre olarak SidebarState türü beklediğinde
  /// kullanması için fake state kaydeder.
  setUpAll(() {
    registerFallbackValue(MockSidebarState());
  });

  /// Her testten önce çalışır.
  /// Yeni bir MockSidebarCubit örneği oluşturur, böylece testler izole olur.
  setUp(() {
    mockSidebarCubit = MockSidebarCubit();

    when(
      () => mockSidebarCubit.stream,
    ).thenAnswer((invocation) => const Stream<SidebarState>.empty());
  });

  /// Testte SideBarItem widget’ını saracak container.
  Widget _buildTestableWidget(Widget child) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => mockSidebarCubit,
        child: child,
      ),
    );
  }

  group("Sidebar Component", () {
    testWidgets('have the expected item name', (tester) async {
      /// Cubit’in state getter’ı çağrıldığında, sahte bir SidebarState döner.
      /// Burada seçili ve hover edilen index yok (default durum).
      when(() => mockSidebarCubit.state).thenAnswer(
        (invocation) {
          return SidebarState(selectedIndex: 0, hoveredIndex: null);
        },
      );

      await tester.pumpWidget(
        _buildTestableWidget(
          SideBarItem(
            itemName: 'Dashboard',
            iconBuilder: (showHighlight) => Icon(Icons.dashboard),
            index: 1,
            onTap: (_) {},
          ),
        ),
      );

      /// Widget ağacında tam olarak 1 tane "Dashboard" yazısı arar ve bulmasını bekler.
      /// Böylece metnin doğru göründüğünü test eder.
      expect(find.text('Dashboard'), findsOneWidget);
    });

    /// Mouse üzerine gelince ve çıkınca Cubit'in setHover metodunun çağrılması test edilir.
    testWidgets('calls setHover on mouse enter and exit', (tester) async {
      /// Cubit’in state taklit edilir.
      when(() => mockSidebarCubit.state).thenReturn(
        SidebarState(selectedIndex: 0, hoveredIndex: null),
      );

      /// setHover metodu çağrılınca hiçbir şey yapmaz (null döner).
      when(() => mockSidebarCubit.setHover(any())).thenReturn(null);

      await tester.pumpWidget(
        _buildTestableWidget(
          SideBarItem(
            itemName: 'Hover Test',
            iconBuilder: (_) => Icon(Icons.dashboard),
            index: 2,
            onTap: (_) {},
          ),
        ),
      );

      /// Test edilen widget’ın merkez noktası bulunur.
      final finder = find.byType(SideBarItem);
      final center = tester.getCenter(finder);

      /// Mouse pointer'ı için test jesturu oluşturulur, ekranın sol üstünden başlar.
      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);

      /// Fareyi widget dışına taşı (hover çıkışı tetiklemesi için).
      await gesture.moveTo(Offset(-100, -100));
      await tester.pump();

      /// Fareyi widget içine taşı (hover girişi tetiklemesi için).
      await gesture.moveTo(center);
      await tester.pump();

      /// setHover(2) çağrısının en az 1 kere yapıldığını doğrula.
      expect(
        verify(() => mockSidebarCubit.setHover(2)).callCount,
        greaterThanOrEqualTo(1),
      );

      // Fareyi widget dışına taşı (hover çıkışı tetiklemesi için).
      await gesture.moveTo(Offset(-100, -100));
      await tester.pump();

      /// Fare tekrar dışarı çıkınca setHover(null) çağrısı yapıldığı doğrulanır.
      expect(
        verify(() => mockSidebarCubit.setHover(null)).callCount,
        greaterThanOrEqualTo(1),
      );
    });

    /// Tıklandığında selectIndex ve onTap çağrılır mı?
    testWidgets('calls selectIndex and onTap when tapped', (tester) async {
      /// tapped isimli bool değişken, onTap fonksiyonunun çalıştığını göstermek için.
      bool tapped = false;

      /// Cubit’in state mock hali.
      when(() => mockSidebarCubit.state).thenReturn(
        SidebarState(selectedIndex: 0, hoveredIndex: null),
      );

      /// selectIndex metodunun mock hali
      when(() => mockSidebarCubit.selectIndex(3)).thenReturn(null);

      await tester.pumpWidget(
        _buildTestableWidget(
          SideBarItem(
            itemName: 'Tap Test',
            iconBuilder: (_) => Icon(Icons.dashboard),
            index: 3,
            onTap: (_) => tapped = true,
          ),
        ),
      );

      /// InkWell üzerine tap işlemi simüle edilir, ardından widget yeniden build edilir.
      await tester.tap(find.byType(InkWell));
      await tester.pump();

      /// onTap fonksiyonunun çağrıldığı doğrulanır (tapped true olmalı).
      expect(tapped, isTrue);

      /// Cubit’in selectIndex(3) metodunun kesinlikle 1 kere çağrıldığı kontrol edilir.
      verify(() => mockSidebarCubit.selectIndex(3)).called(1);
    });

    /// Seçili item arka plan rengini gösteriyor mu?
    testWidgets('shows highlighted background when selected', (tester) async {
      when(() => mockSidebarCubit.state).thenReturn(
        SidebarState(selectedIndex: 4, hoveredIndex: null),
      );

      await tester.pumpWidget(
        _buildTestableWidget(
          SideBarItem(
            itemName: 'Highlight Test',
            iconBuilder: (_) => Icon(Icons.dashboard),
            index: 4,
            onTap: (_) {},
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.byKey(const Key('highlighted_background')),
      );
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, const Color(0xff4880FF));
    });

    testWidgets('in case text color is selected', (tester) async {
      when(() => mockSidebarCubit.state).thenReturn(
        SidebarState(selectedIndex: 5, hoveredIndex: null),
      );
      await tester.pumpWidget(
        _buildTestableWidget(
          SideBarItem(
            itemName: 'Color Test',
            iconBuilder: (_) => Icon(Icons.dashboard),
            index: 5,
            onTap: (_) {},
          ),
        ),
      );

      final textSelected = tester.widget<Text>(
        find.byKey(const Key('sidebar_item_text')),
      );
      final textStyle = textSelected.style as TextStyle;
      expect(textStyle.color, const Color(0xFFFFFFFF));
    });

    testWidgets('in case no text color is selected', (tester) async {
      when(() => mockSidebarCubit.state).thenReturn(
        SidebarState(selectedIndex: 5, hoveredIndex: null),
      );

      await tester.pumpWidget(
        _buildTestableWidget(
          SideBarItem(
            itemName: 'Color Test',
            iconBuilder: (_) => Icon(Icons.dashboard),
            index: 2,
            onTap: (_) {},
          ),
        ),
      );

      final textSelected = tester.widget<Text>(
        find.byKey(const Key('sidebar_item_text')),
      );
      final textStyle = textSelected.style as TextStyle;
      expect(textStyle.color, const Color(0xff202224));
    });
  });
}
