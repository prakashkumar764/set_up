import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DSCheckbox Widget Tests', () {
    late DSCheckboxState currentState;
    late ValueChanged<DSCheckboxState> onChanged;

    setUp(() {
      currentState = DSCheckboxState.unSelected;
      onChanged = (DSCheckboxState newState) {
        currentState = newState;
      };
    });

    Widget createTestWidget({
      DSCheckboxState? state,
      bool disabled = false,
      String? label,
      ValueChanged<DSCheckboxState>? onChangedCallback,
    }) {
      return MaterialApp(
        theme: dsTheme,
        home: Scaffold(
          body: DSCheckbox(
            state: state ?? currentState,
            onChanged: onChangedCallback ?? onChanged,
            disabled: disabled,
            label: label,
          ),
        ),
      );
    }

    testWidgets('should render checkbox with unselected state', (tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.byType(DSCheckbox), findsOneWidget);
      expect(find.byType(GestureDetector), findsOneWidget);
      expect(find.byType(AnimatedContainer), findsOneWidget);
      expect(find.byType(DSImage), findsNothing);
    });

    testWidgets('should render checkbox with selected state', (tester) async {
      await tester.pumpWidget(
        createTestWidget(state: DSCheckboxState.selected),
      );

      expect(find.byType(DSCheckbox), findsOneWidget);
      expect(find.byType(DSImage), findsOneWidget);
    });

    testWidgets('should render checkbox with indeterminate state', (
      tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(state: DSCheckboxState.indeterminate),
      );

      expect(find.byType(DSCheckbox), findsOneWidget);
      expect(find.byType(DSImage), findsOneWidget);
    });

    testWidgets('should render label when provided', (tester) async {
      const testLabel = 'Test Label';
      await tester.pumpWidget(createTestWidget(label: testLabel));

      expect(find.byType(DSText), findsOneWidget);
      expect(find.text(testLabel), findsOneWidget);

      final dsText = tester.widget<DSText>(find.byType(DSText));
      expect(dsText.text, testLabel);
      expect(dsText.maxLines, 1);
      expect(dsText.overflow, TextOverflow.ellipsis);
    });

    testWidgets('should not render label when not provided', (tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.byType(DSText), findsNothing);
    });

    testWidgets('should not render label when empty string', (tester) async {
      await tester.pumpWidget(createTestWidget(label: ''));

      expect(find.byType(DSText), findsNothing);
    });

    testWidgets(
      'should handle tap and change state from unselected to selected',
      (tester) async {
        await tester.pumpWidget(createTestWidget());

        expect(currentState, DSCheckboxState.unSelected);

        await tester.tap(find.byType(GestureDetector));
        await tester.pump();

        expect(currentState, DSCheckboxState.selected);
      },
    );

    testWidgets(
      'should handle tap and change state from selected to unselected',
      (tester) async {
        currentState = DSCheckboxState.selected;
        await tester.pumpWidget(createTestWidget());

        expect(currentState, DSCheckboxState.selected);

        await tester.tap(find.byType(GestureDetector));
        await tester.pump();

        expect(currentState, DSCheckboxState.unSelected);
      },
    );

    testWidgets(
      'should handle tap and change state from indeterminate to unselected',
      (tester) async {
        currentState = DSCheckboxState.indeterminate;
        await tester.pumpWidget(createTestWidget());

        expect(currentState, DSCheckboxState.indeterminate);

        await tester.tap(find.byType(GestureDetector));
        await tester.pump();

        expect(currentState, DSCheckboxState.unSelected);
      },
    );

    testWidgets('should not handle tap when disabled', (tester) async {
      await tester.pumpWidget(createTestWidget(disabled: true));

      expect(currentState, DSCheckboxState.unSelected);

      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(currentState, DSCheckboxState.unSelected);
    });

    testWidgets('should have proper animation duration', (tester) async {
      await tester.pumpWidget(createTestWidget());

      final container = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );
      expect(container.duration, const Duration(milliseconds: 150));
    });

    testWidgets('should have proper row layout', (tester) async {
      await tester.pumpWidget(createTestWidget(label: 'Test'));

      final row = tester.widget<Row>(find.byType(Row));
      expect(row.mainAxisSize, MainAxisSize.min);
    });

    testWidgets('should have DSSpacingWidget when label is provided', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget(label: 'Test'));

      expect(find.byType(DSSpacingWidget), findsOneWidget);
    });

    testWidgets('should handle state changes properly with callback', (
      tester,
    ) async {
      var callbackInvoked = false;
      DSCheckboxState? receivedState;

      await tester.pumpWidget(
        createTestWidget(
          onChangedCallback: (state) {
            callbackInvoked = true;
            receivedState = state;
          },
        ),
      );

      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(callbackInvoked, true);
      expect(receivedState, DSCheckboxState.selected);
    });

    testWidgets('should not invoke callback when disabled', (tester) async {
      var callbackInvoked = false;

      await tester.pumpWidget(
        createTestWidget(
          disabled: true,
          onChangedCallback: (state) {
            callbackInvoked = true;
          },
        ),
      );

      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(callbackInvoked, false);
    });

    testWidgets('should wrap label text in Flexible widget', (tester) async {
      await tester.pumpWidget(createTestWidget(label: 'Test Label'));

      expect(find.byType(Flexible), findsOneWidget);

      final flexible = tester.widget<Flexible>(find.byType(Flexible));
      expect(flexible.child, isA<DSText>());
    });

    testWidgets('should have proper text style for label', (tester) async {
      await tester.pumpWidget(createTestWidget(label: 'Test Label'));

      final dsText = tester.widget<DSText>(find.byType(DSText));
      expect(dsText.textStyle, DSTextStyleType.primaryButtonLMedium);
    });

    testWidgets('should toggle between all states correctly', (tester) async {
      await tester.pumpWidget(
        createTestWidget(state: DSCheckboxState.unSelected),
      );
      await tester.tap(find.byType(GestureDetector));
      await tester.pump();
      expect(currentState, DSCheckboxState.selected);

      await tester.pumpWidget(
        createTestWidget(state: DSCheckboxState.selected),
      );
      await tester.tap(find.byType(GestureDetector));
      await tester.pump();
      expect(currentState, DSCheckboxState.unSelected);

      await tester.pumpWidget(
        createTestWidget(state: DSCheckboxState.indeterminate),
      );
      await tester.tap(find.byType(GestureDetector));
      await tester.pump();
      expect(currentState, DSCheckboxState.unSelected);
    });

    testWidgets('should handle null label gracefully', (tester) async {
      await tester.pumpWidget(createTestWidget(label: null));

      expect(find.byType(DSText), findsNothing);
      expect(find.byType(Flexible), findsNothing);
    });

    testWidgets('should show icon only for selected and indeterminate states', (
      tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(state: DSCheckboxState.unSelected),
      );
      expect(find.byType(DSImage), findsNothing);

      await tester.pumpWidget(
        createTestWidget(state: DSCheckboxState.selected),
      );
      expect(find.byType(DSImage), findsOneWidget);

      await tester.pumpWidget(
        createTestWidget(state: DSCheckboxState.indeterminate),
      );
      expect(find.byType(DSImage), findsOneWidget);
    });
    testWidgets('should show minus icon for indeterminate state', (
      tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(state: DSCheckboxState.indeterminate),
      );

      expect(find.byType(DSImage), findsOneWidget);

      final dsImage = tester.widget<DSImage>(find.byType(DSImage));
      expect(dsImage.path, DSIcons.icMinus);
    });

    testWidgets('should not show any icon for unselected state', (
      tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(state: DSCheckboxState.unSelected),
      );

      expect(find.byType(DSImage), findsNothing);
    });

    testWidgets(
      'should update icon when state changes from selected to indeterminate',
      (tester) async {
        await tester.pumpWidget(
          createTestWidget(state: DSCheckboxState.selected),
        );

        DSImage dsImage = tester.widget<DSImage>(find.byType(DSImage));
        expect(dsImage.path, DSIcons.icCheck);

        await tester.pumpWidget(
          createTestWidget(state: DSCheckboxState.indeterminate),
        );
        await tester.pump();

        dsImage = tester.widget<DSImage>(find.byType(DSImage));
        expect(dsImage.path, DSIcons.icMinus);
      },
    );

    testWidgets(
      'should update icon when state changes from indeterminate to selected',
      (tester) async {
        await tester.pumpWidget(
          createTestWidget(state: DSCheckboxState.indeterminate),
        );

        DSImage dsImage = tester.widget<DSImage>(find.byType(DSImage));
        expect(dsImage.path, DSIcons.icMinus);

        await tester.pumpWidget(
          createTestWidget(state: DSCheckboxState.selected),
        );
        await tester.pump();

        dsImage = tester.widget<DSImage>(find.byType(DSImage));
        expect(dsImage.path, DSIcons.icCheck);
      },
    );

    testWidgets(
      'should remove icon when state changes from selected to unselected',
      (tester) async {
        await tester.pumpWidget(
          createTestWidget(state: DSCheckboxState.selected),
        );
        expect(find.byType(DSImage), findsOneWidget);

        await tester.pumpWidget(
          createTestWidget(state: DSCheckboxState.unSelected),
        );
        await tester.pump();

        expect(find.byType(DSImage), findsNothing);
      },
    );

    testWidgets(
      'should remove icon when state changes from indeterminate to unselected',
      (tester) async {
        await tester.pumpWidget(
          createTestWidget(state: DSCheckboxState.indeterminate),
        );
        expect(find.byType(DSImage), findsOneWidget);

        await tester.pumpWidget(
          createTestWidget(state: DSCheckboxState.unSelected),
        );
        await tester.pump();

        expect(find.byType(DSImage), findsNothing);
      },
    );
  });
}
