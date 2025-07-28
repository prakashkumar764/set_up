import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DSToggle Widget Tests', () {
    testWidgets('Renders toggle value false state', (
      WidgetTester tester,
    ) async {
      bool toggleValue = false;

      await tester.pumpWidget(
        MaterialApp(
          theme: dsTheme,
          home: Scaffold(
            body: DSToggle(
              label: "Test Label",
              value: toggleValue,
              onChanged: (val) {
                toggleValue = val;
              },
            ),
          ),
        ),
      );
      BuildContext context = tester.element(find.byType(DSToggle));

      expect(find.byType(DSToggle), findsOneWidget);
      final animatedContainer = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );
      final BoxDecoration? decoration =
          animatedContainer.decoration as BoxDecoration?;
      final Color? actualColor = decoration?.color;
      final expectedColor = context.dsColors.surfaceNeutralContainer5;

      expect(actualColor, expectedColor);

      //ThumbColor
      final thumbContainer = tester.widget<Container>(
        find.descendant(
          of: find.byType(Align),
          matching: find.byType(Container),
        ),
      );

      final BoxDecoration? thumbDecoration =
          thumbContainer.decoration as BoxDecoration?;
      final thumbColor = thumbDecoration?.color;
      final expectedThumbColor = context.dsColors.iconOnSurfaceDefault;
      expect(thumbColor, expectedThumbColor);

      //Label color
      final dsText = tester.widget<DSText>(find.byType(DSText));
      expect(find.byType(DSText), findsOneWidget);
      final actualLabelColor = dsText.textColor;

      final expectedLabelColor = context.dsColors.textNeutralOnWhite;

      expect(actualLabelColor, expectedLabelColor);
      //toggle tap
      final toggleFinder = find.byType(GestureDetector);
      expect(toggleValue, false);

      await tester.tap(toggleFinder);
      await tester.pumpAndSettle();

      expect(toggleValue, true);
    });

    testWidgets('Renders toggle value true state', (WidgetTester tester) async {
      bool toggleValue = true;

      await tester.pumpWidget(
        MaterialApp(
          theme: dsTheme,
          home: Scaffold(
            body: DSToggle(
              label: "Test Label",
              value: toggleValue,
              onChanged: (val) {
                toggleValue = val;
              },
            ),
          ),
        ),
      );
      BuildContext context = tester.element(find.byType(DSToggle));
      expect(find.byType(DSToggle), findsOneWidget);
      final animatedContainer = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );
      final BoxDecoration? decoration =
          animatedContainer.decoration as BoxDecoration?;
      final Color? actualColor = decoration?.color;
      final expectedColor = context.dsColors.surfacePrimaryDefault;

      expect(actualColor, expectedColor);

      //ThumbColor
      final thumbContainer = tester.widget<Container>(
        find.descendant(
          of: find.byType(Align),
          matching: find.byType(Container),
        ),
      );

      final BoxDecoration? thumbDecoration =
          thumbContainer.decoration as BoxDecoration?;
      final thumbColor = thumbDecoration?.color;
      final expectedThumbColor = context.dsColors.iconOnSurfaceDefault;
      expect(thumbColor, expectedThumbColor);

      //Label color
      final dsText = tester.widget<DSText>(find.byType(DSText));
      expect(find.byType(DSText), findsOneWidget);
      final actualLabelColor = dsText.textColor;

      final expectedLabelColor = context.dsColors.textNeutralOnWhite;

      expect(actualLabelColor, expectedLabelColor);
      //toggle tap
      final toggleFinder = find.byType(GestureDetector);
      expect(toggleValue, true);

      await tester.tap(toggleFinder);
      await tester.pumpAndSettle();

      expect(toggleValue, false);
    });

    testWidgets('Renders toggle value false with disabled state', (
      WidgetTester tester,
    ) async {
      bool toggleValue = false;

      await tester.pumpWidget(
        MaterialApp(
          theme: dsTheme,
          home: Scaffold(
            body: DSToggle(
              label: "Test Label",
              value: toggleValue,
              enabled: false,
              onChanged: (val) {
                toggleValue = val;
              },
            ),
          ),
        ),
      );
      BuildContext context = tester.element(find.byType(DSToggle));
      expect(find.byType(DSToggle), findsOneWidget);
      final animatedContainer = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );

      final BoxDecoration? decoration =
          animatedContainer.decoration as BoxDecoration?;
      final Color? actualColor = decoration?.color;
      final expectedColor = context.dsColors.surfaceNeutralDisabled;

      expect(actualColor, expectedColor);

      //ThumbColor
      final thumbContainer = tester.widget<Container>(
        find.descendant(
          of: find.byType(Align),
          matching: find.byType(Container),
        ),
      );

      final BoxDecoration? thumbDecoration =
          thumbContainer.decoration as BoxDecoration?;
      final thumbColor = thumbDecoration?.color;
      final expectedThumbColor = context.dsColors.iconNeutralDisabled;
      expect(thumbColor, expectedThumbColor);

      //Label color
      final dsText = tester.widget<DSText>(find.byType(DSText));
      expect(find.byType(DSText), findsOneWidget);
      final actualLabelColor = dsText.textColor;

      final expectedLabelColor = context.dsColors.textNeutralDisabled;

      expect(actualLabelColor, expectedLabelColor);
      //toggle tap
      final toggleFinder = find.byType(GestureDetector);
      expect(toggleValue, false);

      await tester.tap(toggleFinder);
      await tester.pumpAndSettle();

      expect(toggleValue, false);
    });

    testWidgets('Renders toggle value true with disabled state', (
      WidgetTester tester,
    ) async {
      bool toggleValue = true;

      await tester.pumpWidget(
        MaterialApp(
          theme: dsTheme,
          home: Scaffold(
            body: DSToggle(
              label: "Test Label",
              value: toggleValue,
              enabled: false,
              onChanged: (val) {
                toggleValue = val;
              },
            ),
          ),
        ),
      );
      BuildContext context = tester.element(find.byType(DSToggle));
      expect(find.byType(DSToggle), findsOneWidget);
      final animatedContainer = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );
      final BoxDecoration? decoration =
          animatedContainer.decoration as BoxDecoration?;
      final Color? actualColor = decoration?.color;
      final expectedColor = context.dsColors.surfacePrimaryDisabled;

      expect(actualColor, expectedColor);

      //ThumbColor
      final thumbContainer = tester.widget<Container>(
        find.descendant(
          of: find.byType(Align),
          matching: find.byType(Container),
        ),
      );

      final BoxDecoration? thumbDecoration =
          thumbContainer.decoration as BoxDecoration?;
      final thumbColor = thumbDecoration?.color;
      final expectedThumbColor = context.dsColors.iconOnSurfaceDefault;
      expect(thumbColor, expectedThumbColor);

      //Label color
      final dsText = tester.widget<DSText>(find.byType(DSText));
      expect(find.byType(DSText), findsOneWidget);
      final actualLabelColor = dsText.textColor;

      final expectedLabelColor = context.dsColors.textNeutralOnWhite;

      expect(actualLabelColor, expectedLabelColor);
      //toggle tap
      final toggleFinder = find.byType(GestureDetector);
      expect(toggleValue, true);

      await tester.tap(toggleFinder);
      await tester.pumpAndSettle();

      expect(toggleValue, true);
    });

    testWidgets('Does not show label if null or empty', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: dsTheme,
          home: DSToggle(value: false, label: '', onChanged: (_) {}),
        ),
      );

      expect(find.byType(DSText), findsNothing);
    });
  });
}
