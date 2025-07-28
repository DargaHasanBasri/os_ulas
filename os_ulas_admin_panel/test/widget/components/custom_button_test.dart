import 'package:flutter_test/flutter_test.dart';
import 'package:os_ulas_admin_panel/export.dart';

void main() {
  Widget _buildTestableWidget(Widget child) {
    return MaterialApp(
      home: Scaffold(
        body: child,
      ),
    );
  }

  group("Custom Button Widget Test", () {
    testWidgets("displays default title when no title is provided", (
      tester,
    ) async {
      await tester.pumpWidget(
        _buildTestableWidget(CustomButton()),
      );
      await tester.pumpAndSettle();
      expect(find.text('default'), findsOneWidget);
    });

    testWidgets("displays given title correctly", (tester) async {
      final testTitle = 'Add New User';
      await tester.pumpWidget(
        _buildTestableWidget(
          CustomButton(
            title: testTitle,
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text(testTitle), findsOneWidget);
    });

    testWidgets("displays icon when icon is provided", (tester) async {
      final testIcon = Image.memory(
        Uint8List(0),
        key: const Key('test_icon'),
        errorBuilder: (_, __, ___) => const SizedBox(),
      );
      await tester.pumpWidget(
        _buildTestableWidget(
          CustomButton(
            title: 'Icon Test',
            icon: testIcon,
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('test_icon')), findsOneWidget);
    });

    testWidgets("does not display icon when icon is not provided", (
      tester,
    ) async {
      await tester.pumpWidget(
        _buildTestableWidget(
          CustomButton(
            title: 'have not icon',
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(Image), findsNothing);
    });

    testWidgets("backgroundColor is applied correctly", (tester) async {
      final testBackgroundColor = Colors.green;
      await tester.pumpWidget(
        _buildTestableWidget(
          CustomButton(
            title: 'BackgroundColor test',
            backgroundColor: testBackgroundColor,
          ),
        ),
      );

      await tester.pumpAndSettle();

      final inkWidget = tester.widget<Ink>(
        find.byKey(const Key('custom-button-ink')),
      );
      final boxDecoration = inkWidget.decoration as BoxDecoration;

      expect(boxDecoration.color, testBackgroundColor);
    });

    testWidgets('default backgroundColor when none is provided', (
      tester,
    ) async {
      await tester.pumpWidget(
        _buildTestableWidget(
          CustomButton(title: 'Test BackgroundColor'),
        ),
      );

      await tester.pumpAndSettle();

      final inkWidget = tester.widget<Ink>(
        find.byKey(const Key('custom-button-ink')),
      );
      final boxDecoration = inkWidget.decoration as BoxDecoration;

      expect(boxDecoration.color, ColorName.dodgerBlue);
    });

    testWidgets(
      "onTap callback is triggered when button is tapped",
      (tester) async {
        bool tapped = false;

        await tester.pumpWidget(
          _buildTestableWidget(
            CustomButton(
              title: 'Tap Test',
              onTap: () => tapped = true,
            ),
          ),
        );
        await tester.pumpAndSettle();
        await tester.tap(
          find.byKey(
            const Key('custom-button-inkWell'),
          ),
        );
        await tester.pumpAndSettle();

        expect(tapped, isTrue);
      },
    );

    testWidgets("height parameter is applied correctly", (tester) async {
      final heightTest = 60.0;

      await tester.pumpWidget(
        _buildTestableWidget(
          CustomButton(
            title: 'Height test',
            height: heightTest,
          ),
        ),
      );

      await tester.pumpAndSettle();
      final inkWidget = tester.widget<Ink>(
        find.byKey(
          const Key('custom-button-ink'),
        ),
      );

      expect(inkWidget.height, heightTest);
    });

    testWidgets(
      "borderRadius parameter is applied correctly",
      (tester) async {
        final double borderRadiusTest = 16.0;
        await tester.pumpWidget(
          _buildTestableWidget(
            CustomButton(
              title: 'Border radius test',
              borderRadius: borderRadiusTest,
            ),
          ),
        );

        await tester.pumpAndSettle();

        final materialWidget = tester.widget<Material>(
          find.byKey(const Key('custom-button-material')),
        );

        final inkWellWidget = tester.widget<InkWell>(
          find.byKey(const Key('custom-button-inkWell')),
        );

        final inkWidget = tester.widget<Ink>(
          find.byKey(const Key('custom-button-ink')),
        );
        final boxDecoration = inkWidget.decoration as BoxDecoration;

        expect(
          materialWidget.borderRadius,
          BorderRadius.circular(borderRadiusTest),
        );

        expect(
          inkWellWidget.borderRadius,
          BorderRadius.circular(borderRadiusTest),
        );
        expect(
          boxDecoration.borderRadius,
          BorderRadius.circular(borderRadiusTest),
        );
      },
    );

    testWidgets(
      "default borderRadius parameter is applied correctly",
      (tester) async {
        final double defaultBorderRadius = 8.0;

        await tester.pumpWidget(
          _buildTestableWidget(
            CustomButton(
              title: 'Default Border radius test',
            ),
          ),
        );

        await tester.pumpAndSettle();

        final materialWidget = tester.widget<Material>(
          find.byKey(const Key('custom-button-material')),
        );

        final inkWellWidget = tester.widget<InkWell>(
          find.byKey(const Key('custom-button-inkWell')),
        );

        final inkWidget = tester.widget<Ink>(
          find.byKey(const Key('custom-button-ink')),
        );
        final boxDecoration = inkWidget.decoration as BoxDecoration;

        expect(
          materialWidget.borderRadius,
          BorderRadius.circular(defaultBorderRadius),
        );

        expect(
          inkWellWidget.borderRadius,
          BorderRadius.circular(defaultBorderRadius),
        );
        expect(
          boxDecoration.borderRadius,
          BorderRadius.circular(defaultBorderRadius),
        );
      },
    );

    testWidgets('applies given textStyle if provided', (tester) async {
      const customTextStyle = TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      );

      await tester.pumpWidget(
        _buildTestableWidget(
          CustomButton(
            title: 'Styled Text',
            textStyle: customTextStyle,
          ),
        ),
      );

      await tester.pumpAndSettle();

      final textWidget = tester.widget<Text>(find.text('Styled Text'));

      expect(textWidget.style, equals(customTextStyle));
    });

    testWidgets('applies default textStyle when textStyle is not provided', (
      tester,
    ) async {
      await tester.pumpWidget(
        _buildTestableWidget(
          CustomButton(
            title: 'Default Style',
          ),
        ),
      );

      await tester.pumpAndSettle();

      final textWidget = tester.widget<Text>(find.text('Default Style'));

      expect(textWidget.style, isNotNull);

      expect(textWidget.style?.color, ColorName.white);
    });
  });
}
