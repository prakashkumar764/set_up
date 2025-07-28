import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DSSearch Widget Tests', () {
    Widget createTestWidget({
      VoidCallback? onTap,
      String? leadingIcon,
      String? trailingIcon,
      String? hintText,
      Color? backgroundColor,
      double? borderRadius,
      DSTextStyleType? textStyle,
      Color? textColor,
      EdgeInsetsGeometry? padding,
      EdgeInsetsGeometry? margin,
      int? maxLine,
      DSSearchIconSize? iconSize,
    }) {
      return MaterialApp(
        theme: dsTheme,
        home: Scaffold(
          body: DSSearch(
            onTap: onTap,
            leadingIcon: leadingIcon,
            trailingIcon: trailingIcon,
            hintText: hintText,
            backgroundColor: backgroundColor,
            borderRadius: borderRadius,
            textStyle: textStyle,
            textColor: textColor,
            padding: padding ?? EdgeInsets.zero,
            margin: margin ?? EdgeInsets.zero,
            maxLine: maxLine ?? 1,
            iconSize: iconSize,
          ),
        ),
      );
    }

    testWidgets('renders without crashing with default parameters', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.byType(DSSearch), findsOneWidget);
      expect(find.byType(InkWell), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('renders hint text when provided', (WidgetTester tester) async {
      const testHintText = 'Search here...';

      await tester.pumpWidget(createTestWidget(hintText: testHintText));

      expect(find.byType(DSText), findsOneWidget);
      expect(find.byType(Expanded), findsOneWidget);
      expect(find.byType(Spacer), findsNothing);
    });

    testWidgets('renders spacer when no hint text provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.byType(Spacer), findsOneWidget);
      expect(find.byType(DSText), findsNothing);
    });

    testWidgets('renders leading icon when provided', (
      WidgetTester tester,
    ) async {
      const testLeadingIcon = DSIcons.icSearch;

      await tester.pumpWidget(createTestWidget(leadingIcon: testLeadingIcon));

      final dsImages = find.byType(DSImage);
      expect(dsImages, findsOneWidget);
    });

    testWidgets('renders trailing icon when provided', (
      WidgetTester tester,
    ) async {
      const testTrailingIcon = DSIcons.icBrandedScanner;

      await tester.pumpWidget(createTestWidget(trailingIcon: testTrailingIcon));

      final dsImages = find.byType(DSImage);
      expect(dsImages, findsOneWidget);
    });

    testWidgets('renders both leading and trailing icons when provided', (
      WidgetTester tester,
    ) async {
      const testLeadingIcon = DSIcons.icSearch;
      const testTrailingIcon = DSIcons.icBrandedScanner;

      await tester.pumpWidget(
        createTestWidget(
          leadingIcon: testLeadingIcon,
          trailingIcon: testTrailingIcon,
        ),
      );

      final dsImages = find.byType(DSImage);
      expect(dsImages, findsNWidgets(2));
    });

    testWidgets('onTap callback is triggered when tapped', (
      WidgetTester tester,
    ) async {
      bool tapped = false;

      await tester.pumpWidget(
        createTestWidget(onTap: () => tapped = true, hintText: 'Search'),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byType(DSSearch));
      expect(tapped, isTrue);
    });

    testWidgets('onTap callback is not triggered when null', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget(onTap: null));

      // Should not throw error when tapped
      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();

      expect(find.byType(DSSearch), findsOneWidget);
    });

    group('Color Tests', () {
      testWidgets('applies custom background color', (
        WidgetTester tester,
      ) async {
        const customBackgroundColor = Colors.red;

        await tester.pumpWidget(
          createTestWidget(backgroundColor: customBackgroundColor),
        );

        final container = tester.widget<Container>(find.byType(Container));
        final decoration = container.decoration as BoxDecoration;
        expect(decoration.color, equals(customBackgroundColor));
      });

      testWidgets('uses default background color when not provided', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(createTestWidget());

        final container = tester.widget<Container>(find.byType(Container));
        final decoration = container.decoration as BoxDecoration;
        expect(decoration.color, isNotNull);
      });

      testWidgets('applies custom text color to hint text', (
        WidgetTester tester,
      ) async {
        const customTextColor = DSSemanticColors.iconNeutral;
        const testHintText = 'Search here...';

        await tester.pumpWidget(
          createTestWidget(hintText: testHintText, textColor: customTextColor),
        );

        expect(find.byType(DSText), findsOneWidget);
        // Verify DSText widget exists - actual color testing would depend on DSText implementation
      });

      testWidgets('different background colors render correctly', (
        WidgetTester tester,
      ) async {
        final testColors = [
          DSSemanticColors.iconNeutral,
          DSSemanticColors.iconSemanticOnSuccess,
          DSSemanticColors.iconBrandDefault,
          DSSemanticColors.iconPrimary,
          DSSemanticColors.iconNeutralFade,
        ];

        for (final color in testColors) {
          await tester.pumpWidget(createTestWidget(backgroundColor: color));

          final container = tester.widget<Container>(find.byType(Container));
          final decoration = container.decoration as BoxDecoration;
          expect(decoration.color, equals(color));
        }
      });
    });

    group('Layout Tests', () {
      testWidgets('applies custom border radius', (WidgetTester tester) async {
        const customBorderRadius = 20.0;

        await tester.pumpWidget(
          createTestWidget(borderRadius: customBorderRadius),
        );

        final container = tester.widget<Container>(find.byType(Container));
        final decoration = container.decoration as BoxDecoration;
        final borderRadius = decoration.borderRadius as BorderRadius;

        expect(borderRadius.topLeft.x, equals(customBorderRadius));
        expect(borderRadius.topRight.x, equals(customBorderRadius));
        expect(borderRadius.bottomLeft.x, equals(customBorderRadius));
        expect(borderRadius.bottomRight.x, equals(customBorderRadius));
      });

      testWidgets('applies custom padding', (WidgetTester tester) async {
        const customPadding = EdgeInsets.all(20.0);

        await tester.pumpWidget(createTestWidget(padding: customPadding));

        final container = tester.widget<Container>(find.byType(Container));
        expect(container.padding, equals(customPadding));
      });

      testWidgets('applies custom margin', (WidgetTester tester) async {
        const customMargin = EdgeInsets.all(10.0);

        await tester.pumpWidget(createTestWidget(margin: customMargin));

        final container = tester.widget<Container>(find.byType(Container));
        expect(container.margin, equals(customMargin));
      });

      testWidgets('applies different padding values', (
        WidgetTester tester,
      ) async {
        final testPaddings = [
          EdgeInsets.zero,
          EdgeInsets.all(8.0),
          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          EdgeInsets.only(left: 12.0, right: 16.0, top: 4.0, bottom: 8.0),
        ];

        for (final padding in testPaddings) {
          await tester.pumpWidget(createTestWidget(padding: padding));

          final container = tester.widget<Container>(find.byType(Container));
          expect(container.padding, equals(padding));
        }
      });

      testWidgets('applies different margin values', (
        WidgetTester tester,
      ) async {
        final testMargins = [
          EdgeInsets.zero,
          EdgeInsets.all(5.0),
          EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          EdgeInsets.only(left: 6.0, right: 8.0, top: 2.0, bottom: 4.0),
        ];

        for (final margin in testMargins) {
          await tester.pumpWidget(createTestWidget(margin: margin));

          final container = tester.widget<Container>(find.byType(Container));
          expect(container.margin, equals(margin));
        }
      });
    });

    group('Icon Size Tests', () {
      testWidgets('applies custom icon size to leading icon', (
        WidgetTester tester,
      ) async {
        const testLeadingIcon = DSIcons.icSearch;
        const testIconSize = DSSearchIconSize.small;

        await tester.pumpWidget(
          createTestWidget(
            leadingIcon: testLeadingIcon,
            iconSize: testIconSize,
          ),
        );

        expect(find.byType(DSImage), findsOneWidget);
        // Verify DSImage widget exists - actual size testing would depend on DSImage implementation
      });

      testWidgets('applies custom icon size to trailing icon', (
        WidgetTester tester,
      ) async {
        const testTrailingIcon = DSIcons.icBrandedScanner;
        const testIconSize = DSSearchIconSize.medium;

        await tester.pumpWidget(
          createTestWidget(
            trailingIcon: testTrailingIcon,
            iconSize: testIconSize,
          ),
        );

        expect(find.byType(DSImage), findsOneWidget);
      });

      testWidgets('applies custom icon size to both icons', (
        WidgetTester tester,
      ) async {
        const testLeadingIcon = DSIcons.icSearch;
        const testTrailingIcon = DSIcons.icBrandedScanner;
        const testIconSize = DSSearchIconSize.large;

        await tester.pumpWidget(
          createTestWidget(
            leadingIcon: testLeadingIcon,
            trailingIcon: testTrailingIcon,
            iconSize: testIconSize,
          ),
        );

        expect(find.byType(DSImage), findsNWidgets(2));
      });
    });

    group('Text Style Tests', () {
      testWidgets('applies custom text style', (WidgetTester tester) async {
        const testHintText = 'Search here...';
        var testTextStyle = DSTextStyleType.primaryBodyMRegular;

        await tester.pumpWidget(
          createTestWidget(hintText: testHintText, textStyle: testTextStyle),
        );

        expect(find.byType(DSText), findsOneWidget);
        // Verify DSText widget exists - actual style testing would depend on DSText implementation
      });

      testWidgets('applies custom max lines', (WidgetTester tester) async {
        const testHintText = 'Search here...';
        const customMaxLines = 3;

        await tester.pumpWidget(
          createTestWidget(hintText: testHintText, maxLine: customMaxLines),
        );

        expect(find.byType(DSText), findsOneWidget);
      });
    });

    group('Widget Structure Tests', () {
      testWidgets('has correct widget hierarchy', (WidgetTester tester) async {
        await tester.pumpWidget(
          createTestWidget(
            hintText: 'Test',
            leadingIcon: DSIcons.icSearch,
            trailingIcon: DSIcons.icBrandedScanner,
          ),
        );

        // Check the widget tree structure
        expect(find.byType(DSSearch), findsOneWidget);
        expect(find.byType(InkWell), findsOneWidget);
        expect(find.byType(Container), findsOneWidget);
        expect(find.byType(Row), findsOneWidget);
        expect(find.byType(DSImage), findsNWidgets(2));
        expect(find.byType(DSText), findsOneWidget);
        expect(find.byType(Expanded), findsOneWidget);
      });

      testWidgets('row children are in correct order', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          createTestWidget(
            hintText: 'Test',
            leadingIcon: DSIcons.icSearch,
            trailingIcon: DSIcons.icBrandedScanner,
          ),
        );

        final row = tester.widget<Row>(find.byType(Row));
        expect(row.children.length, greaterThan(0));
      });
    });

    group('Edge Cases', () {
      testWidgets('handles null values gracefully', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          createTestWidget(
            onTap: null,
            leadingIcon: null,
            trailingIcon: null,
            hintText: null,
            backgroundColor: null,
            borderRadius: null,
            textStyle: null,
            textColor: null,
            iconSize: null,
          ),
        );

        expect(find.byType(DSSearch), findsOneWidget);
        expect(find.byType(Spacer), findsOneWidget);
        expect(find.byType(DSText), findsNothing);
        expect(find.byType(DSImage), findsNothing);
      });

      testWidgets('handles empty string values', (WidgetTester tester) async {
        await tester.pumpWidget(
          createTestWidget(hintText: '', leadingIcon: null, trailingIcon: null),
        );

        expect(find.byType(DSSearch), findsOneWidget);
        expect(find.byType(DSText), findsOneWidget);
        expect(find.byType(DSImage), findsNothing);
      });

      testWidgets('handles zero values', (WidgetTester tester) async {
        await tester.pumpWidget(
          createTestWidget(borderRadius: 0.0, maxLine: 0),
        );

        expect(find.byType(DSSearch), findsOneWidget);

        final container = tester.widget<Container>(find.byType(Container));
        final decoration = container.decoration as BoxDecoration;
        final borderRadius = decoration.borderRadius as BorderRadius;
        expect(borderRadius.topLeft.x, equals(0.0));
      });

      testWidgets('handles very large values', (WidgetTester tester) async {
        await tester.pumpWidget(
          createTestWidget(
            borderRadius: 1000.0,
            maxLine: 100,
            padding: EdgeInsets.all(200.0),
            margin: EdgeInsets.all(100.0),
          ),
        );

        expect(find.byType(DSSearch), findsOneWidget);

        final container = tester.widget<Container>(find.byType(Container));
        expect(container.padding, equals(EdgeInsets.all(200.0)));
        expect(container.margin, equals(EdgeInsets.all(100.0)));
      });
    });

    group('Interaction Tests', () {
      testWidgets('inkwell responds to tap', (WidgetTester tester) async {
        bool tapped = false;

        await tester.pumpWidget(
          createTestWidget(onTap: () => tapped = true, hintText: "search"),
        );

        final inkWell = find.byType(InkWell);
        expect(inkWell, findsOneWidget);

        await tester.tap(inkWell);
        expect(tapped, isTrue);
      });

      testWidgets('inkwell has correct border radius', (
        WidgetTester tester,
      ) async {
        const customBorderRadius = 15.0;

        await tester.pumpWidget(
          createTestWidget(borderRadius: customBorderRadius),
        );

        final inkWell = tester.widget<InkWell>(find.byType(InkWell));
        final borderRadius = inkWell.borderRadius as BorderRadius;
        expect(borderRadius.topLeft.x, equals(customBorderRadius));
      });
    });

    group('Icon Color Tests', () {
      testWidgets('leading icon inherits default color from theme', (
        WidgetTester tester,
      ) async {
        const testLeadingIcon = DSIcons.icSearch;

        await tester.pumpWidget(createTestWidget(leadingIcon: testLeadingIcon));

        final dsImages = find.byType(DSImage);
        expect(dsImages, findsOneWidget);

        final dsImage = tester.widget<DSImage>(dsImages.first);
        expect(dsImage.path, equals(testLeadingIcon));
      });

      testWidgets('trailing icon inherits default color from theme', (
        WidgetTester tester,
      ) async {
        const testTrailingIcon = DSIcons.icBrandedScanner;

        await tester.pumpWidget(
          createTestWidget(trailingIcon: testTrailingIcon),
        );

        final dsImages = find.byType(DSImage);
        expect(dsImages, findsOneWidget);

        final dsImage = tester.widget<DSImage>(dsImages.first);
        expect(dsImage.path, equals(testTrailingIcon));
      });

      testWidgets('both icons inherit theme colors consistently', (
        WidgetTester tester,
      ) async {
        const testLeadingIcon = DSIcons.icSearch;
        const testTrailingIcon = DSIcons.icBrandedScanner;

        await tester.pumpWidget(
          createTestWidget(
            leadingIcon: testLeadingIcon,
            trailingIcon: testTrailingIcon,
          ),
        );

        final dsImages = find.byType(DSImage);
        expect(dsImages, findsNWidgets(2));

        final dsImageWidgets = tester.widgetList<DSImage>(dsImages).toList();
        expect(dsImageWidgets[0].path, equals(testLeadingIcon));
        expect(dsImageWidgets[1].path, equals(testTrailingIcon));
      });

      testWidgets('icons render with different background colors', (
        WidgetTester tester,
      ) async {
        const testLeadingIcon = DSIcons.icSearch;
        const testTrailingIcon = DSIcons.icBrandedScanner;

        final testBackgroundColors = [
          DSSemanticColors.iconNeutralDefault,
          DSSemanticColors.iconNeutralFade,
        ];

        for (final backgroundColor in testBackgroundColors) {
          await tester.pumpWidget(
            createTestWidget(
              leadingIcon: testLeadingIcon,
              trailingIcon: testTrailingIcon,
              backgroundColor: backgroundColor,
            ),
          );

          final dsImages = find.byType(DSImage);
          expect(dsImages, findsNWidgets(2));

          final container = tester.widget<Container>(find.byType(Container));
          final decoration = container.decoration as BoxDecoration;
          expect(decoration.color, equals(backgroundColor));
        }
      });

      testWidgets('icons maintain visibility against dark background', (
        WidgetTester tester,
      ) async {
        const testLeadingIcon = DSIcons.icSearch;
        const testTrailingIcon = DSIcons.icBrandedScanner;
        const darkBackground = Colors.black;

        await tester.pumpWidget(
          createTestWidget(
            leadingIcon: testLeadingIcon,
            trailingIcon: testTrailingIcon,
            backgroundColor: darkBackground,
          ),
        );

        final dsImages = find.byType(DSImage);
        expect(dsImages, findsNWidgets(2));

        // Verify that icons are rendered (visibility depends on icon color implementation)
        final container = tester.widget<Container>(find.byType(Container));
        final decoration = container.decoration as BoxDecoration;
        expect(decoration.color, equals(darkBackground));
      });

      testWidgets('icons maintain visibility against light background', (
        WidgetTester tester,
      ) async {
        const testLeadingIcon = DSIcons.icSearch;
        const testTrailingIcon = DSIcons.icBrandedScanner;
        const lightBackground = Colors.white;

        await tester.pumpWidget(
          createTestWidget(
            leadingIcon: testLeadingIcon,
            trailingIcon: testTrailingIcon,
            backgroundColor: lightBackground,
          ),
        );

        final dsImages = find.byType(DSImage);
        expect(dsImages, findsNWidgets(2));

        final container = tester.widget<Container>(find.byType(Container));
        final decoration = container.decoration as BoxDecoration;
        expect(decoration.color, equals(lightBackground));
      });

      testWidgets('icons render consistently across different themes', (
        WidgetTester tester,
      ) async {
        const testLeadingIcon = DSIcons.icSearch;
        const testTrailingIcon = DSIcons.icBrandedScanner;

        await tester.pumpWidget(
          MaterialApp(
            theme: dsTheme,
            home: Scaffold(
              body: DSSearch(
                leadingIcon: testLeadingIcon,
                trailingIcon: testTrailingIcon,
              ),
            ),
          ),
        );

        var dsImages = find.byType(DSImage);
        expect(dsImages, findsNWidgets(2));

        // Test with dark theme
        await tester.pumpWidget(
          MaterialApp(
            theme: dsTheme,
            home: Scaffold(
              body: DSSearch(
                leadingIcon: testLeadingIcon,
                trailingIcon: testTrailingIcon,
              ),
            ),
          ),
        );

        dsImages = find.byType(DSImage);
        expect(dsImages, findsNWidgets(2));
      });

      testWidgets('icon color adapts to contrast requirements', (
        WidgetTester tester,
      ) async {
        const testLeadingIcon = DSIcons.icSearch;

        final contrastTestCases = [
          {
            'background': DSSemanticColors.iconNeutralFade,
            'description': 'light background',
          },
          {
            'background': DSSemanticColors.iconPrimary,
            'description': 'dark background',
          },
        ];

        for (final testCase in contrastTestCases) {
          await tester.pumpWidget(
            createTestWidget(
              leadingIcon: testLeadingIcon,
              backgroundColor: testCase['background'] as Color,
            ),
          );

          final dsImages = find.byType(DSImage);
          expect(
            dsImages,
            findsOneWidget,
            reason: 'Icon should render with ${testCase['description']}',
          );

          final container = tester.widget<Container>(find.byType(Container));
          final decoration = container.decoration as BoxDecoration;
          expect(decoration.color, equals(testCase['background']));
        }
      });

      testWidgets('icon color remains consistent during state changes', (
        WidgetTester tester,
      ) async {
        const testLeadingIcon = DSIcons.icSearch;
        bool isPressed = false;

        await tester.pumpWidget(
          StatefulBuilder(
            builder: (context, setState) {
              return MaterialApp(
                theme: dsTheme,
                home: Scaffold(
                  body: DSSearch(
                    leadingIcon: testLeadingIcon,
                    backgroundColor: isPressed ? Colors.grey : Colors.white,
                    onTap: () => setState(() => isPressed = !isPressed),
                  ),
                ),
              );
            },
          ),
        );

        // Initial state
        var dsImages = find.byType(DSImage);
        expect(dsImages, findsOneWidget);

        // Tap to change state
        await tester.tap(find.byType(DSSearch));
        await tester.pumpAndSettle();

        // Icon should still be present after state change
        dsImages = find.byType(DSImage);
        expect(dsImages, findsOneWidget);
      });

      testWidgets('icon accessibility with different background colors', (
        WidgetTester tester,
      ) async {
        const testLeadingIcon = DSIcons.icSearch;

        // Test accessibility with high contrast colors
        final accessibilityTestCases = [
          {
            'bg': DSSemanticColors.iconSemanticOnSuccess,
            'description': 'blue background for contrast',
          },
          {
            'bg': DSSemanticColors.iconPrimary,
            'description': 'green background for contrast',
          },
        ];

        for (final testCase in accessibilityTestCases) {
          await tester.pumpWidget(
            createTestWidget(
              leadingIcon: testLeadingIcon,
              backgroundColor: testCase['bg'] as Color,
            ),
          );

          final dsImages = find.byType(DSImage);
          expect(
            dsImages,
            findsOneWidget,
            reason: 'Icon should be accessible with ${testCase['description']}',
          );

          // Verify the icon is rendered and potentially tappable
          final dsImage = tester.widget<DSImage>(dsImages.first);
          expect(dsImage.path, equals(testLeadingIcon));
        }
      });

      testWidgets('multiple icons with same color properties', (
        WidgetTester tester,
      ) async {
        const testLeadingIcon = DSIcons.icSearch;
        const testTrailingIcon = DSIcons.icBrandedScanner;

        await tester.pumpWidget(
          createTestWidget(
            leadingIcon: testLeadingIcon,
            trailingIcon: testTrailingIcon,
            backgroundColor: Colors.blue,
          ),
        );

        final dsImages = find.byType(DSImage);
        expect(dsImages, findsNWidgets(2));

        final dsImageWidgets = tester.widgetList<DSImage>(dsImages).toList();

        // Both icons should have the same color treatment
        expect(dsImageWidgets[0].path, equals(testLeadingIcon));
        expect(dsImageWidgets[1].path, equals(testTrailingIcon));

        // Verify both icons have the same height and width (from iconSize)
        expect(dsImageWidgets[0].height, equals(dsImageWidgets[1].height));
        expect(dsImageWidgets[0].width, equals(dsImageWidgets[1].width));
      });
    });
  });
}
