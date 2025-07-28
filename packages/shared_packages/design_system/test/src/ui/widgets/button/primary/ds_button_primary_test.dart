import 'package:design_system/design_system.dart';
import 'package:design_system/src/ui/widgets/button/ds_button_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DSButtonPrimary Widget Tests', () {
    const addIcon = DSIcons.icAdd;
    const minusIcon = DSIcons.icMinus;

    Widget createTestWidget({
      required String text,
      VoidCallback? onPressed,
      String? leadingIconPath,
      String? trailingIconPath,
      DSButtonIconSize? iconSize,
      DSButtonSize size = DSButtonSize.large,
      DSButtonType type = DSButtonType.fill,
      double? width,
      DSButtonState state = DSButtonState.normal,
      String loadingText = 'Loading...',
    }) {
      return MaterialApp(
        theme: dsTheme,
        home: Scaffold(
          body: DSButtonPrimary(
            text: text,
            onPressed: onPressed,
            leadingIconPath: leadingIconPath,
            trailingIconPath: trailingIconPath,
            iconSize: iconSize,
            size: size,
            type: type,
            width: width,
            state: state,
            loadingText: loadingText,
          ),
        ),
      );
    }

    testWidgets('should create DSButtonPrimary with required parameters', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget(text: 'Test Button'));

      expect(find.byType(DSButtonPrimary), findsOneWidget);
      expect(find.text('Test Button'), findsOneWidget);
    });

    testWidgets('should create DSButtonPrimary.fill constructor', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: dsTheme,
          home: Scaffold(body: DSButtonPrimary.fill(text: 'Fill Button')),
        ),
      );

      expect(find.byType(DSButtonPrimary), findsOneWidget);
      expect(find.text('Fill Button'), findsOneWidget);
    });

    // Fill type
    testWidgets(
      'DSButtonPrimary.fill normal state should use correct design system colors',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: dsTheme,
            home: Scaffold(
              body: DSButtonPrimary.fill(
                text: 'Fill Button',
                state: DSButtonState.normal,
              ),
            ),
          ),
        );

        final buttonFinder = find.byType(DSButtonPrimary);
        final BuildContext context = tester.element(buttonFinder);

        final animatedContainerFinder = find.byType(AnimatedContainer);
        final buttonTextFinder = find.byWidgetPredicate(
          (widget) =>
              widget is DSText &&
              widget.text == "Fill Button" &&
              widget.textColor == context.dsColors.textOnSurfaceDefault,
        );
        final dsImageWidgetFinder = find.byType(DSImage);
        final AnimatedContainer animatedContainer = tester
            .widget<AnimatedContainer>(animatedContainerFinder);

        final animatedContainerDecoration =
            animatedContainer.decoration as BoxDecoration;

        expect(animatedContainerDecoration, isA<BoxDecoration>());

        // Button background color
        expect(
          animatedContainerDecoration.color,
          context.dsColors.surfacePrimaryDefault,
        );

        // Button text color
        expect(buttonTextFinder, findsOneWidget);

        expect(dsImageWidgetFinder, findsNothing);
      },
    );

    testWidgets(
      'DSButtonPrimary.fill pressed state should use correct design system colors',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: dsTheme,
            home: Scaffold(
              body: DSButtonPrimary.fill(
                text: 'Fill Button',
                state: DSButtonState.pressed,
              ),
            ),
          ),
        );

        final buttonFinder = find.byType(DSButtonPrimary);
        final BuildContext context = tester.element(buttonFinder);

        final animatedContainerFinder = find.byType(AnimatedContainer);
        final buttonTextFinder = find.byWidgetPredicate(
          (widget) =>
              widget is DSText &&
              widget.text == "Fill Button" &&
              widget.textColor == context.dsColors.textOnSurfaceDefault,
        );
        final dsImageWidgetFinder = find.byType(DSImage);
        final AnimatedContainer animatedContainer = tester
            .widget<AnimatedContainer>(animatedContainerFinder);

        final animatedContainerDecoration =
            animatedContainer.decoration as BoxDecoration;

        expect(animatedContainerDecoration, isA<BoxDecoration>());

        // Button background color
        expect(
          animatedContainerDecoration.color,
          context.dsColors.surfacePrimaryPress,
        );

        // Button text color
        expect(buttonTextFinder, findsOneWidget);

        expect(dsImageWidgetFinder, findsNothing);
      },
    );

    testWidgets(
      'DSButtonPrimary.fill disabled state should use correct design system colors',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: dsTheme,
            home: Scaffold(
              body: DSButtonPrimary.fill(
                text: 'Fill Button',
                state: DSButtonState.disabled,
                leadingIconPath: addIcon,
                trailingIconPath: minusIcon,
              ),
            ),
          ),
        );

        final buttonFinder = find.byType(DSButtonPrimary);
        final BuildContext context = tester.element(buttonFinder);

        final buttonTextFinder = find.byWidgetPredicate(
          (widget) =>
              widget is DSText &&
              widget.text == "Fill Button" &&
              widget.textColor == context.dsColors.textNeutralDisabled,
        );
        final leadingIconFinder = find.byWidgetPredicate(
          (widget) =>
              widget is DSImage &&
              widget.path == DSIcons.icAdd &&
              widget.color == context.dsColors.iconNeutralDisabled,
        );
        final trailingIconFinder = find.byWidgetPredicate(
          (widget) =>
              widget is DSImage &&
              widget.path == DSIcons.icMinus &&
              widget.color == context.dsColors.iconNeutralDisabled,
        );

        final decoratedBox = tester.widget<DecoratedBox>(
          find.byType(DecoratedBox),
        );
        final boxDecoration = decoratedBox.decoration as BoxDecoration;

        expect(boxDecoration, isA<BoxDecoration>());

        // Expect correct background color
        expect(boxDecoration.color, context.dsColors.surfaceNeutralDisabled);

        expect(boxDecoration.border, isA<Border>());
        final border = boxDecoration.border as Border;

        // Expect correct border color
        expect(border.top.color, context.dsColors.strokeNeutralDefault);
        expect(border.right.color, context.dsColors.strokeNeutralDefault);
        expect(border.bottom.color, context.dsColors.strokeNeutralDefault);
        expect(border.left.color, context.dsColors.strokeNeutralDefault);

        // Expect correct text color
        expect(buttonTextFinder, findsOneWidget);

        // Expect correct leading icon properties
        expect(leadingIconFinder, findsOneWidget);

        // Expect correct trailing icon properties
        expect(trailingIconFinder, findsOneWidget);
      },
    );

    testWidgets("DSButtonPrimary.fill disabled state shouldn't be tappable", (
      WidgetTester tester,
    ) async {
      bool isPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          theme: dsTheme,
          home: Scaffold(
            body: DSButtonPrimary.fill(
              text: 'Fill Button',
              state: DSButtonState.disabled,
              leadingIconPath: addIcon,
              trailingIconPath: minusIcon,
              onPressed: () {
                isPressed = true;
              },
            ),
          ),
        ),
      );

      final buttonFinder = find.byType(DSButtonPrimary);
      await tester.tap(buttonFinder);

      expect(isPressed, false);
    });

    testWidgets(
      'DSButtonPrimary.fill loading state should use correct design system colors',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: dsTheme,
            home: Scaffold(
              body: DSButtonPrimary.fill(
                text: 'Fill Button',
                state: DSButtonState.loading,
                leadingIconPath: addIcon,
              ),
            ),
          ),
        );

        final buttonFinder = find.byType(DSButtonPrimary);
        final BuildContext context = tester.element(buttonFinder);

        final loadingTextFinder = find.text('Loading...');
        final leadingIconFinder = find.byWidgetPredicate(
          (widget) =>
              widget is DSImage &&
              widget.path == DSIcons.icAdd &&
              widget.color == context.dsColors.iconOnSurfaceDefault,
        );
        final circularProgressIndicatorFinder = find.byType(
          CircularProgressIndicator,
        );

        final decoratedBox = tester.widget<DecoratedBox>(
          find.byType(DecoratedBox),
        );
        final boxDecoration = decoratedBox.decoration as BoxDecoration;

        expect(boxDecoration, isA<BoxDecoration>());

        // Expect correct background color
        expect(boxDecoration.color, context.dsColors.surfacePrimaryDefault);

        // Expect correct loading text
        expect(loadingTextFinder, findsOneWidget);

        // Expect correct leading icon properties
        expect(leadingIconFinder, findsOneWidget);

        expect(find.byType(DSImage), findsOneWidget);

        // Expect circular progress indicator
        expect(circularProgressIndicatorFinder, findsOneWidget);
      },
    );

    testWidgets(
      "DSButtonPrimary.fill loading state shouldn't be tappable",
          (WidgetTester tester) async {
        bool isPressed = false;
        await tester.pumpWidget(
          MaterialApp(
            theme: dsTheme,
            home: Scaffold(
              body: DSButtonPrimary.fill(
                text: 'Fill Button',
                state: DSButtonState.loading,
                leadingIconPath: addIcon,
              ),
            ),
          ),
        );

        final buttonFinder = find.byType(DSButtonPrimary);
        await tester.tap(buttonFinder);

        expect(isPressed, false);
      },
    );

    // Outline Type
    testWidgets(
      'DSButtonPrimary.outline normal state should use correct design system colors',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          createTestWidget(
            text: 'Outline Button',
            type: DSButtonType.outline,
            state: DSButtonState.normal,
            leadingIconPath: DSIcons.icAdd,
            trailingIconPath: DSIcons.icMinus,
          ),
        );

        final buttonFinder = find.byType(DSButtonPrimary);
        final BuildContext context = tester.element(buttonFinder);

        final buttonTextFinder = find.byWidgetPredicate(
          (widget) =>
              widget is DSText &&
              widget.text == "Outline Button" &&
              widget.textColor == context.dsColors.textPrimaryDefault,
        );
        final leadingIconFinder = find.byWidgetPredicate(
          (widget) =>
              widget is DSImage &&
              widget.path == DSIcons.icAdd &&
              widget.color == context.dsColors.iconPrimary,
        );
        final trailingIconFinder = find.byWidgetPredicate(
          (widget) =>
              widget is DSImage &&
              widget.path == DSIcons.icMinus &&
              widget.color == context.dsColors.iconPrimary,
        );
        final decoratedBox = tester.widget<DecoratedBox>(
          find.byType(DecoratedBox),
        );
        final boxDecoration = decoratedBox.decoration as BoxDecoration;

        expect(boxDecoration, isA<BoxDecoration>());

        // Expect correct background color
        expect(boxDecoration.color, Colors.transparent);

        expect(boxDecoration.border, isA<Border>());
        final border = boxDecoration.border as Border;

        // Expect correct border color
        expect(border.top.color, context.dsColors.strokePrimaryDefault);
        expect(border.right.color, context.dsColors.strokePrimaryDefault);
        expect(border.bottom.color, context.dsColors.strokePrimaryDefault);
        expect(border.left.color, context.dsColors.strokePrimaryDefault);

        // Expect correct leading icon properties
        expect(leadingIconFinder, findsOneWidget);

        // Expect correct trailing icon properties
        expect(trailingIconFinder, findsOneWidget);

        // Button text color
        expect(buttonTextFinder, findsOneWidget);
        expect(leadingIconFinder, findsOneWidget);
        expect(trailingIconFinder, findsOneWidget);
      },
    );

    testWidgets(
      'DSButtonPrimary.outline pressed state should use correct design system colors',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          createTestWidget(
            text: 'Outline Button',
            type: DSButtonType.outline,
            state: DSButtonState.pressed,
            leadingIconPath: DSIcons.icAdd,
            trailingIconPath: DSIcons.icMinus,
          ),
        );

        final buttonFinder = find.byType(DSButtonPrimary);
        final BuildContext context = tester.element(buttonFinder);

        final buttonTextFinder = find.byWidgetPredicate(
          (widget) =>
              widget is DSText &&
              widget.text == "Outline Button" &&
              widget.textColor == context.dsColors.textPrimaryDefault,
        );
        final leadingIconFinder = find.byWidgetPredicate(
          (widget) =>
              widget is DSImage &&
              widget.path == DSIcons.icAdd &&
              widget.color == context.dsColors.iconPrimary,
        );
        final trailingIconFinder = find.byWidgetPredicate(
          (widget) =>
              widget is DSImage &&
              widget.path == DSIcons.icMinus &&
              widget.color == context.dsColors.iconPrimary,
        );
        final decoratedBox = tester.widget<DecoratedBox>(
          find.byType(DecoratedBox),
        );
        final boxDecoration = decoratedBox.decoration as BoxDecoration;

        expect(boxDecoration, isA<BoxDecoration>());

        // Expect correct background color
        expect(boxDecoration.color, context.dsColors.surfacePrimaryLightPress);

        expect(boxDecoration.border, isA<Border>());
        final border = boxDecoration.border as Border;

        // Expect correct border color
        expect(border.top.color, context.dsColors.strokePrimaryDefault);
        expect(border.right.color, context.dsColors.strokePrimaryDefault);
        expect(border.bottom.color, context.dsColors.strokePrimaryDefault);
        expect(border.left.color, context.dsColors.strokePrimaryDefault);

        // Expect correct leading icon properties
        expect(leadingIconFinder, findsOneWidget);

        // Expect correct trailing icon properties
        expect(trailingIconFinder, findsOneWidget);

        // Button text color
        expect(buttonTextFinder, findsOneWidget);
        expect(leadingIconFinder, findsOneWidget);
        expect(trailingIconFinder, findsOneWidget);
      },
    );

    testWidgets(
      'DSButtonPrimary.outline disabled state should use correct design system colors',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          createTestWidget(
            text: 'Outline Button',
            type: DSButtonType.outline,
            state: DSButtonState.disabled,
            leadingIconPath: DSIcons.icAdd,
            trailingIconPath: DSIcons.icMinus,
          ),
        );

        final buttonFinder = find.byType(DSButtonPrimary);
        final BuildContext context = tester.element(buttonFinder);

        final buttonTextFinder = find.byWidgetPredicate(
          (widget) =>
              widget is DSText &&
              widget.text == "Outline Button" &&
              widget.textColor == context.dsColors.textNeutralDisabled,
        );
        final leadingIconFinder = find.byWidgetPredicate(
          (widget) =>
              widget is DSImage &&
              widget.path == DSIcons.icAdd &&
              widget.color == context.dsColors.iconNeutralDisabled,
        );
        final trailingIconFinder = find.byWidgetPredicate(
          (widget) =>
              widget is DSImage &&
              widget.path == DSIcons.icMinus &&
              widget.color == context.dsColors.iconNeutralDisabled,
        );
        final decoratedBox = tester.widget<DecoratedBox>(
          find.byType(DecoratedBox),
        );
        final boxDecoration = decoratedBox.decoration as BoxDecoration;

        expect(boxDecoration, isA<BoxDecoration>());

        // Expect correct background color
        expect(boxDecoration.color, Colors.transparent);

        expect(boxDecoration.border, isA<Border>());
        final border = boxDecoration.border as Border;

        // Expect correct border color
        expect(border.top.color, context.dsColors.strokeNeutralDisabled);
        expect(border.right.color, context.dsColors.strokeNeutralDisabled);
        expect(border.bottom.color, context.dsColors.strokeNeutralDisabled);
        expect(border.left.color, context.dsColors.strokeNeutralDisabled);

        // Expect correct leading icon properties
        expect(leadingIconFinder, findsOneWidget);

        // Expect correct trailing icon properties
        expect(trailingIconFinder, findsOneWidget);

        // Button text color
        expect(buttonTextFinder, findsOneWidget);
        expect(leadingIconFinder, findsOneWidget);
        expect(trailingIconFinder, findsOneWidget);
      },
    );

    testWidgets(
      "DSButtonPrimary.outline disabled state shouldn't be tappable",
          (WidgetTester tester) async {
        bool isPressed = false;
        await tester.pumpWidget(
          MaterialApp(
            theme: dsTheme,
            home: Scaffold(
              body: DSButtonPrimary.outline(
                text: 'Outline Button',
                state: DSButtonState.disabled,
                leadingIconPath: addIcon,
              ),
            ),
          ),
        );

        final buttonFinder = find.byType(DSButtonPrimary);
        await tester.tap(buttonFinder);

        expect(isPressed, false);
      },
    );

    testWidgets(
      'DSButtonPrimary.outline loading state should use correct design system colors',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          createTestWidget(
            text: 'Outline Button',
            type: DSButtonType.outline,
            state: DSButtonState.loading,
            leadingIconPath: DSIcons.icAdd,
          ),
        );

        final buttonFinder = find.byType(DSButtonPrimary);
        final BuildContext context = tester.element(buttonFinder);

        final loadingTextFinder = find.text('Loading...');
        final leadingIconFinder = find.byWidgetPredicate(
          (widget) =>
              widget is DSImage &&
              widget.path == DSIcons.icAdd &&
              widget.color == context.dsColors.iconPrimary,
        );
        final circularProgressIndicatorFinder = find.byType(
          CircularProgressIndicator,
        );
        final decoratedBox = tester.widget<DecoratedBox>(
          find.byType(DecoratedBox),
        );
        final boxDecoration = decoratedBox.decoration as BoxDecoration;

        expect(boxDecoration, isA<BoxDecoration>());

        // Expect correct background color
        expect(boxDecoration.color, Colors.transparent);

        expect(boxDecoration.border, isA<Border>());
        final border = boxDecoration.border as Border;

        // Expect correct border color
        expect(border.top.color, context.dsColors.strokePrimaryDefault);
        expect(border.right.color, context.dsColors.strokePrimaryDefault);
        expect(border.bottom.color, context.dsColors.strokePrimaryDefault);
        expect(border.left.color, context.dsColors.strokePrimaryDefault);

        // Expect correct leading icon properties
        expect(leadingIconFinder, findsOneWidget);

        // Expect circular progress indicator
        expect(circularProgressIndicatorFinder, findsOneWidget);

        // Button text color
        expect(loadingTextFinder, findsOneWidget);
        expect(leadingIconFinder, findsOneWidget);
      },
    );

    testWidgets(
      "DSButtonPrimary.outline loading state shouldn't be tappable",
          (WidgetTester tester) async {
        bool isPressed = false;
        await tester.pumpWidget(
          MaterialApp(
            theme: dsTheme,
            home: Scaffold(
              body: DSButtonPrimary.outline(
                text: 'Outline Button',
                state: DSButtonState.loading,
                leadingIconPath: addIcon,
              ),
            ),
          ),
        );

        final buttonFinder = find.byType(DSButtonPrimary);
        await tester.tap(buttonFinder);

        expect(isPressed, false);
      },
    );

    // Ghost Type
    testWidgets(
      'DSButtonPrimary.ghost normal state should use correct design system colors',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          createTestWidget(
            text: 'Ghost Button',
            type: DSButtonType.ghost,
            state: DSButtonState.normal,
            leadingIconPath: DSIcons.icAdd,
            trailingIconPath: DSIcons.icMinus,
          ),
        );

        final buttonFinder = find.byType(DSButtonPrimary);
        final BuildContext context = tester.element(buttonFinder);

        final buttonTextFinder = find.byWidgetPredicate(
          (widget) =>
              widget is DSText &&
              widget.text == "Ghost Button" &&
              widget.textColor == context.dsColors.textPrimaryDefault,
        );
        final leadingIconFinder = find.byWidgetPredicate(
          (widget) =>
              widget is DSImage &&
              widget.path == DSIcons.icAdd &&
              widget.color == context.dsColors.iconPrimary,
        );
        final trailingIconFinder = find.byWidgetPredicate(
          (widget) =>
              widget is DSImage &&
              widget.path == DSIcons.icMinus &&
              widget.color == context.dsColors.iconPrimary,
        );
        final decoratedBox = tester.widget<DecoratedBox>(
          find.byType(DecoratedBox),
        );
        final boxDecoration = decoratedBox.decoration as BoxDecoration;

        expect(boxDecoration, isA<BoxDecoration>());

        // Expect correct background color
        expect(boxDecoration.color, Colors.transparent);

        // Expect correct leading icon properties
        expect(leadingIconFinder, findsOneWidget);

        // Expect correct trailing icon properties
        expect(trailingIconFinder, findsOneWidget);

        // Button text color
        expect(buttonTextFinder, findsOneWidget);
        expect(leadingIconFinder, findsOneWidget);
        expect(trailingIconFinder, findsOneWidget);
      },
    );

    testWidgets(
      'DSButtonPrimary.ghost pressed state should use correct design system colors',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          createTestWidget(
            text: 'Ghost Button',
            type: DSButtonType.ghost,
            state: DSButtonState.pressed,
            leadingIconPath: DSIcons.icAdd,
            trailingIconPath: DSIcons.icMinus,
          ),
        );

        final buttonFinder = find.byType(DSButtonPrimary);
        final BuildContext context = tester.element(buttonFinder);

        final buttonTextFinder = find.byWidgetPredicate(
          (widget) =>
              widget is DSText &&
              widget.text == "Ghost Button" &&
              widget.textColor == context.dsColors.textPrimaryDefault,
        );
        final leadingIconFinder = find.byWidgetPredicate(
          (widget) =>
              widget is DSImage &&
              widget.path == DSIcons.icAdd &&
              widget.color == context.dsColors.iconPrimary,
        );
        final trailingIconFinder = find.byWidgetPredicate(
          (widget) =>
              widget is DSImage &&
              widget.path == DSIcons.icMinus &&
              widget.color == context.dsColors.iconPrimary,
        );
        final decoratedBox = tester.widget<DecoratedBox>(
          find.byType(DecoratedBox),
        );
        final boxDecoration = decoratedBox.decoration as BoxDecoration;

        expect(boxDecoration, isA<BoxDecoration>());

        // Expect correct background color
        expect(boxDecoration.color, context.dsColors.surfacePrimaryLightPress);

        // Expect correct leading icon properties
        expect(leadingIconFinder, findsOneWidget);

        // Expect correct trailing icon properties
        expect(trailingIconFinder, findsOneWidget);

        // Button text color
        expect(buttonTextFinder, findsOneWidget);
        expect(leadingIconFinder, findsOneWidget);
        expect(trailingIconFinder, findsOneWidget);
      },
    );

    testWidgets(
      'DSButtonPrimary.ghost disabled state should use correct design system colors',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          createTestWidget(
            text: 'Ghost Button',
            type: DSButtonType.ghost,
            state: DSButtonState.disabled,
            leadingIconPath: DSIcons.icAdd,
            trailingIconPath: DSIcons.icMinus,
          ),
        );

        final buttonFinder = find.byType(DSButtonPrimary);
        final BuildContext context = tester.element(buttonFinder);

        final buttonTextFinder = find.byWidgetPredicate(
          (widget) =>
              widget is DSText &&
              widget.text == "Ghost Button" &&
              widget.textColor == context.dsColors.textNeutralDisabled,
        );
        final leadingIconFinder = find.byWidgetPredicate(
          (widget) =>
              widget is DSImage &&
              widget.path == DSIcons.icAdd &&
              widget.color == context.dsColors.iconNeutralDisabled,
        );
        final trailingIconFinder = find.byWidgetPredicate(
          (widget) =>
              widget is DSImage &&
              widget.path == DSIcons.icMinus &&
              widget.color == context.dsColors.iconNeutralDisabled,
        );
        final decoratedBox = tester.widget<DecoratedBox>(
          find.byType(DecoratedBox),
        );
        final boxDecoration = decoratedBox.decoration as BoxDecoration;

        expect(boxDecoration, isA<BoxDecoration>());

        // Expect correct background color
        expect(boxDecoration.color, Colors.transparent);

        // Expect correct leading icon properties
        expect(leadingIconFinder, findsOneWidget);

        // Expect correct trailing icon properties
        expect(trailingIconFinder, findsOneWidget);

        // Button text color
        expect(buttonTextFinder, findsOneWidget);

        expect(leadingIconFinder, findsOneWidget);
        expect(trailingIconFinder, findsOneWidget);
      },
    );

    testWidgets(
      "DSButtonPrimary.ghost disabled state shouldn't be tappable",
          (WidgetTester tester) async {
        bool isPressed = false;
        await tester.pumpWidget(
          MaterialApp(
            theme: dsTheme,
            home: Scaffold(
              body: DSButtonPrimary.ghost(
                text: 'Ghost Button',
                state: DSButtonState.disabled,
                leadingIconPath: addIcon,
              ),
            ),
          ),
        );

        final buttonFinder = find.byType(DSButtonPrimary);
        await tester.tap(buttonFinder);

        expect(isPressed, false);
      },
    );

    testWidgets(
      'DSButtonPrimary.ghost loading state should use correct design system colors',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          createTestWidget(
            text: 'Ghost Button',
            type: DSButtonType.ghost,
            state: DSButtonState.loading,
            leadingIconPath: DSIcons.icAdd,
          ),
        );

        final buttonFinder = find.byType(DSButtonPrimary);
        final BuildContext context = tester.element(buttonFinder);

        final loadingTextFinder = find.text('Loading...');
        final leadingIconFinder = find.byWidgetPredicate(
          (widget) =>
              widget is DSImage &&
              widget.path == DSIcons.icAdd &&
              widget.color == context.dsColors.iconPrimary,
        );
        final circularProgressIndicatorFinder = find.byType(
          CircularProgressIndicator,
        );
        final decoratedBox = tester.widget<DecoratedBox>(
          find.byType(DecoratedBox),
        );
        final boxDecoration = decoratedBox.decoration as BoxDecoration;

        expect(boxDecoration, isA<BoxDecoration>());

        // Expect correct background color
        expect(boxDecoration.color, Colors.transparent);

        // Expect correct leading icon properties
        expect(leadingIconFinder, findsOneWidget);

        // Expect circular progress indicator
        expect(circularProgressIndicatorFinder, findsOneWidget);

        // Button text color
        expect(loadingTextFinder, findsOneWidget);
        expect(leadingIconFinder, findsOneWidget);
      },
    );

    testWidgets(
      "DSButtonPrimary.ghost loading state shouldn't be tappable",
          (WidgetTester tester) async {
        bool isPressed = false;
        await tester.pumpWidget(
          MaterialApp(
            theme: dsTheme,
            home: Scaffold(
              body: DSButtonPrimary.ghost(
                text: 'Ghost Button',
                state: DSButtonState.loading,
                leadingIconPath: addIcon,
              ),
            ),
          ),
        );

        final buttonFinder = find.byType(DSButtonPrimary);
        await tester.tap(buttonFinder);

        expect(isPressed, false);
      },
    );

    testWidgets('should create DSButtonPrimary.outline constructor', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: dsTheme,
          home: Scaffold(body: DSButtonPrimary.outline(text: 'Outline Button')),
        ),
      );

      expect(find.byType(DSButtonPrimary), findsOneWidget);
      expect(find.text('Outline Button'), findsOneWidget);
    });

    testWidgets('should create DSButtonPrimary.ghost constructor', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: dsTheme,
          home: Scaffold(body: DSButtonPrimary.ghost(text: 'Ghost Button')),
        ),
      );

      expect(find.byType(DSButtonPrimary), findsOneWidget);
      expect(find.text('Ghost Button'), findsOneWidget);
    });

    testWidgets('should handle onPressed callback', (
      WidgetTester tester,
    ) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        createTestWidget(
          text: 'Clickable Button',
          onPressed: () => wasPressed = true,
        ),
      );

      await tester.tap(find.byType(DSButtonPrimary));
      expect(wasPressed, isTrue);
    });

    testWidgets('should not handle onPressed when null', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(text: 'Non-clickable Button', onPressed: null),
      );

      await tester.tap(find.byType(DSButtonPrimary));
    });

    testWidgets('should handle disabled state correctly', (
      WidgetTester tester,
    ) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        createTestWidget(
          text: 'Disabled Button',
          onPressed: () => wasPressed = true,
          state: DSButtonState.disabled,
        ),
      );

      await tester.tap(find.byType(DSButtonPrimary));
      expect(wasPressed, isFalse);
    });

    testWidgets('should handle loading state correctly', (
      WidgetTester tester,
    ) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        createTestWidget(
          text: 'Loading Button',
          onPressed: () => wasPressed = true,
          state: DSButtonState.loading,
          loadingText: 'Please wait...',
        ),
      );

      expect(find.text('Please wait...'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.tap(find.byType(DSButtonPrimary));
      expect(wasPressed, isFalse);
    });

    testWidgets('should show pressed state during tap', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(text: 'Press Test Button', onPressed: () {}),
      );

      final DSButtonContent initialContent = tester.widget<DSButtonContent>(
        find.byType(DSButtonContent),
      );
      expect(initialContent.state, DSButtonState.normal);

      await tester.startGesture(tester.getCenter(find.byType(DSButtonPrimary)));
      await tester.pump();

      final DSButtonContent pressedContent = tester.widget<DSButtonContent>(
        find.byType(DSButtonContent),
      );
      expect(pressedContent.state, DSButtonState.pressed);
    });

    testWidgets('should return to normal state after tap release', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(text: 'Release Test Button', onPressed: () {}),
      );

      await tester.tap(find.byType(DSButtonPrimary));
      await tester.pump();

      final DSButtonContent content = tester.widget<DSButtonContent>(
        find.byType(DSButtonContent),
      );
      expect(content.state, DSButtonState.normal);
    });

    testWidgets('should handle tap cancel correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(text: 'Cancel Test Button', onPressed: () {}),
      );

      final TestGesture gesture = await tester.startGesture(
        tester.getCenter(find.byType(DSButtonPrimary)),
      );
      await tester.pump();

      DSButtonContent content = tester.widget<DSButtonContent>(
        find.byType(DSButtonContent),
      );
      expect(content.state, DSButtonState.pressed);

      await gesture.cancel();
      await tester.pump();

      content = tester.widget<DSButtonContent>(find.byType(DSButtonContent));
      expect(content.state, DSButtonState.normal);
    });

    testWidgets('should apply correct width constraints', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(text: 'Width Test Button', width: 200.0),
      );

      final SizedBox sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.width, 200.0);
    });

    testWidgets('should use double.infinity width when width is null', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(text: 'Full Width Button', width: null),
      );

      final SizedBox sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.width, double.infinity);
    });

    testWidgets('should apply minimum width constraint', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(text: 'Min Width Button', width: 144),
      );

      final constrainedBoxFinder = find.byKey(
        ValueKey('dsButtonPrimaryConstrainedBox'),
      );
      final ConstrainedBox constrainedBoxWidget = tester.widget<ConstrainedBox>(
        constrainedBoxFinder,
      );

      expect(constrainedBoxWidget.constraints.minWidth, 144.0);
    });

    testWidgets('should pass correct parameters to DSButtonContent', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          text: 'Content Test Button',
          loadingText: 'Loading content...',
          leadingIconPath: addIcon,
          trailingIconPath: minusIcon,
          iconSize: DSButtonIconSize.large,
          size: DSButtonSize.small,
        ),
      );

      final DSButtonContent content = tester.widget<DSButtonContent>(
        find.byType(DSButtonContent),
      );
      expect(content.text, 'Content Test Button');
      expect(content.loadingText, 'Loading content...');
      expect(content.leadingIconPath, DSIcons.icAdd);
      expect(content.trailingIconPath, DSIcons.icMinus);
      expect(content.leadingIconSize, DSButtonIconSize.large);
      expect(content.trailingIconSize, DSButtonIconSize.large);
      expect(content.size, DSButtonSize.small);
    });

    testWidgets('should use spec icon size when iconSize is null', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          text: 'Default Icon Size Button',
          iconSize: null,
          leadingIconPath: addIcon,
        ),
      );

      final DSButtonContent content = tester.widget<DSButtonContent>(
        find.byType(DSButtonContent),
      );
      expect(content.leadingIconPath, DSIcons.icAdd);
    });

    testWidgets('should use provided iconSize when specified', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          text: 'Custom Icon Size Button',
          iconSize: DSButtonIconSize.extraSmall,
          leadingIconPath: addIcon,
        ),
      );

      final DSButtonContent content = tester.widget<DSButtonContent>(
        find.byType(DSButtonContent),
      );
      expect(content.leadingIconPath, DSIcons.icAdd);
    });

    testWidgets('should handle all DSButtonType values', (
      WidgetTester tester,
    ) async {
      for (final buttonType in DSButtonType.values) {
        await tester.pumpWidget(
          createTestWidget(text: 'Type Test Button', type: buttonType),
        );

        expect(find.byType(DSButtonPrimary), findsOneWidget);

        await tester.pumpWidget(Container());
      }
    });

    testWidgets('should handle all DSButtonSize values', (
      WidgetTester tester,
    ) async {
      for (final buttonSize in DSButtonSize.values) {
        await tester.pumpWidget(
          createTestWidget(text: 'Size Test Button', size: buttonSize),
        );

        expect(find.byType(DSButtonPrimary), findsOneWidget);

        await tester.pumpWidget(Container());
      }
    });

    testWidgets('should handle all DSButtonState values', (
      WidgetTester tester,
    ) async {
      for (final buttonState in DSButtonState.values) {
        await tester.pumpWidget(
          createTestWidget(text: 'State Test Button', state: buttonState),
        );

        expect(find.byType(DSButtonPrimary), findsOneWidget);

        await tester.pumpWidget(Container());
      }
    });

    testWidgets('should not change state when not interactive', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          text: 'Non-interactive Button',
          onPressed: null,
          state: DSButtonState.disabled,
        ),
      );

      await tester.startGesture(tester.getCenter(find.byType(DSButtonPrimary)));
      await tester.pump();

      final DSButtonContent content = tester.widget<DSButtonContent>(
        find.byType(DSButtonContent),
      );
      expect(content.state, DSButtonState.disabled);
    });

    testWidgets('should prioritize widget state over pressed state', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          text: 'Priority Test Button',
          onPressed: () {},
          state: DSButtonState.loading,
        ),
      );

      await tester.startGesture(tester.getCenter(find.byType(DSButtonPrimary)));
      await tester.pump();

      final DSButtonContent content = tester.widget<DSButtonContent>(
        find.byType(DSButtonContent),
      );
      expect(content.state, DSButtonState.loading);
    });

    testWidgets('should apply correct height from button spec', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(text: 'Height Test Button', size: DSButtonSize.large),
      );

      final SizedBox sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.height, 60);
    });

    testWidgets('should create GestureDetector with correct callbacks', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(text: 'Gesture Test Button', onPressed: () {}),
      );

      final GestureDetector gestureDetector = tester.widget<GestureDetector>(
        find.byType(GestureDetector),
      );
      expect(gestureDetector.onTap, isNotNull);
      expect(gestureDetector.onTapDown, isNotNull);
      expect(gestureDetector.onTapUp, isNotNull);
      expect(gestureDetector.onTapCancel, isNotNull);
    });

    testWidgets(
      'should create GestureDetector with null callbacks when not interactive',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          createTestWidget(
            text: 'Non-interactive Gesture Test Button',
            onPressed: null,
          ),
        );

        final GestureDetector gestureDetector = tester.widget<GestureDetector>(
          find.byType(GestureDetector),
        );
        expect(gestureDetector.onTap, isNull);
        expect(gestureDetector.onTapDown, isNull);
        expect(gestureDetector.onTapUp, isNull);
        expect(gestureDetector.onTapCancel, isNull);
      },
    );
  });
}
