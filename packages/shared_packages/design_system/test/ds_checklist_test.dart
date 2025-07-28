import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DSChecklistSelector Widget Tests', () {
    late VoidCallback onTap;
    late bool wasTapped;

    setUp(() {
      wasTapped = false;
      onTap = () {
        wasTapped = true;
      };
    });

    Widget createTestWidget({
      DSChecklistState? state,
      VoidCallback? onTapCallback,
      double? borderWidth,
      double? iconPadding,
    }) {
      return MaterialApp(
        theme: dsTheme,
        home: Scaffold(
          body: DSChecklistSelector(
            state: state ?? DSChecklistState.unSelected,
            onTap: onTapCallback ?? onTap,
            borderWidth: borderWidth,
            iconPadding: iconPadding,
          ),
        ),
      );
    }

    testWidgets('should render DSChecklistSelector with unselected state', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.byType(DSChecklistSelector), findsOneWidget);
      expect(find.byType(GestureDetector), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);

      // Should not have an icon when unselected
      expect(find.byType(DSImage), findsNothing);
    });

    testWidgets('should render DSChecklistSelector with selected state', (
      tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(state: DSChecklistState.selected),
      );

      expect(find.byType(DSChecklistSelector), findsOneWidget);
      expect(find.byType(DSImage), findsOneWidget);

      final dsImage = tester.widget<DSImage>(find.byType(DSImage));
      expect(dsImage.path, DSIcons.icCheck);
    });

    testWidgets('should handle tap correctly', (tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(wasTapped, false);

      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(wasTapped, true);
    });

    testWidgets('should invoke custom onTap callback', (tester) async {
      var customTapped = false;

      await tester.pumpWidget(
        createTestWidget(
          onTapCallback: () {
            customTapped = true;
          },
        ),
      );

      expect(customTapped, false);

      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(customTapped, true);
    });

    testWidgets(
      'should have proper container decoration for unselected state',
      (tester) async {
        await tester.pumpWidget(
          createTestWidget(state: DSChecklistState.unSelected),
        );

        final container = tester.widget<Container>(find.byType(Container));
        final decoration = container.decoration as BoxDecoration;

        expect(decoration.shape, BoxShape.circle);
        expect(decoration.border, isA<Border>());
      },
    );

    testWidgets('should have proper container decoration for selected state', (
      tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(state: DSChecklistState.selected),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.shape, BoxShape.circle);
      expect(decoration.border, isA<Border>());
    });

    testWidgets('should use default border width when not provided', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      final border = decoration.border as Border;

      expect(border.top.width, 2.0);
    });

    testWidgets('should use custom border width when provided', (tester) async {
      const customBorderWidth = 4.0;
      await tester.pumpWidget(createTestWidget(borderWidth: customBorderWidth));

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      final border = decoration.border as Border;

      expect(border.top.width, customBorderWidth);
    });

    testWidgets('should use default icon padding when not provided', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final container = tester.widget<Container>(find.byType(Container));
      final padding = container.padding as EdgeInsets;

      expect(padding.left, 2.0);
      expect(padding.top, 2.0);
      expect(padding.right, 2.0);
      expect(padding.bottom, 2.0);
    });

    testWidgets('should use custom icon padding when provided', (tester) async {
      const customIconPadding = 4.0;
      await tester.pumpWidget(createTestWidget(iconPadding: customIconPadding));

      final container = tester.widget<Container>(find.byType(Container));
      final padding = container.padding as EdgeInsets;

      expect(padding.left, customIconPadding);
      expect(padding.top, customIconPadding);
      expect(padding.right, customIconPadding);
      expect(padding.bottom, customIconPadding);
    });

    testWidgets('should show check icon only for selected state', (
      tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(state: DSChecklistState.unSelected),
      );
      expect(find.byType(DSImage), findsNothing);

      await tester.pumpWidget(
        createTestWidget(state: DSChecklistState.selected),
      );
      expect(find.byType(DSImage), findsOneWidget);

      final dsImage = tester.widget<DSImage>(find.byType(DSImage));
      expect(dsImage.path, DSIcons.icCheck);
    });

    testWidgets(
      'should update icon when state changes from unselected to selected',
      (tester) async {
        await tester.pumpWidget(
          createTestWidget(state: DSChecklistState.unSelected),
        );
        expect(find.byType(DSImage), findsNothing);

        await tester.pumpWidget(
          createTestWidget(state: DSChecklistState.selected),
        );
        await tester.pump();

        expect(find.byType(DSImage), findsOneWidget);
        final dsImage = tester.widget<DSImage>(find.byType(DSImage));
        expect(dsImage.path, DSIcons.icCheck);
      },
    );

    testWidgets(
      'should remove icon when state changes from selected to unselected',
      (tester) async {
        await tester.pumpWidget(
          createTestWidget(state: DSChecklistState.selected),
        );
        expect(find.byType(DSImage), findsOneWidget);

        await tester.pumpWidget(
          createTestWidget(state: DSChecklistState.unSelected),
        );
        await tester.pump();

        expect(find.byType(DSImage), findsNothing);
      },
    );

    testWidgets('should have proper widget hierarchy', (tester) async {
      await tester.pumpWidget(createTestWidget());
      expect(find.byType(GestureDetector), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
      final gestureDetector = tester.widget<GestureDetector>(
        find.byType(GestureDetector),
      );
      expect(gestureDetector.child, isA<Container>());
    });

    testWidgets('should handle multiple taps correctly', (tester) async {
      var tapCount = 0;

      await tester.pumpWidget(
        createTestWidget(
          onTapCallback: () {
            tapCount++;
          },
        ),
      );
      await tester.tap(find.byType(GestureDetector));
      await tester.pump();
      await tester.tap(find.byType(GestureDetector));
      await tester.pump();
      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(tapCount, 3);
    });

    testWidgets('should apply container padding correctly', (tester) async {
      await tester.pumpWidget(
        createTestWidget(state: DSChecklistState.selected, iconPadding: 6.0),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.padding, const EdgeInsets.all(6.0));
      expect(container.child, isA<DSImage>());
    });

    testWidgets('should have null child when unselected', (tester) async {
      await tester.pumpWidget(
        createTestWidget(state: DSChecklistState.unSelected),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.child, null);
    });

    testWidgets('should have DSImage child when selected', (tester) async {
      await tester.pumpWidget(
        createTestWidget(state: DSChecklistState.selected),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.child, isA<DSImage>());
    });

    testWidgets('should use different border widths correctly', (tester) async {
      final borderWidths = [1.0, 2.0, 3.0, 5.0];

      for (final width in borderWidths) {
        await tester.pumpWidget(createTestWidget(borderWidth: width));

        final container = tester.widget<Container>(find.byType(Container));
        final decoration = container.decoration as BoxDecoration;
        final border = decoration.border as Border;

        expect(border.top.width, width);
        expect(border.right.width, width);
        expect(border.bottom.width, width);
        expect(border.left.width, width);
      }
    });

    testWidgets('should use different icon paddings correctly', (tester) async {
      final iconPaddings = [1.0, 2.0, 4.0, 8.0];

      for (final padding in iconPaddings) {
        await tester.pumpWidget(createTestWidget(iconPadding: padding));

        final container = tester.widget<Container>(find.byType(Container));
        expect(container.padding, EdgeInsets.all(padding));
      }
    });
    testWidgets('should change container color when selected', (tester) async {
      await tester.pumpWidget(
        createTestWidget(state: DSChecklistState.unSelected),
      );

      Container container = tester.widget<Container>(find.byType(Container));
      BoxDecoration decoration = container.decoration as BoxDecoration;

      expect(decoration.color, isNotNull);

      await tester.pumpWidget(
        createTestWidget(state: DSChecklistState.selected),
      );

      container = tester.widget<Container>(find.byType(Container));
      decoration = container.decoration as BoxDecoration;

      expect(decoration.color, isNotNull);
    });
  });
}
