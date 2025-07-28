import 'package:design_system/design_system.dart';
import 'package:design_system/src/ui/models/button/ds_button_spec.dart';
import 'package:design_system/src/ui/widgets/button/ds_button_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DSButtonContent', () {
    late DSButtonSpec mockButtonSpec;
    late BoxDecoration mockDecoration;

    setUp(() {
      mockButtonSpec = const DSButtonSpec(
        buttonHeight: 48.0,
        buttonIconSize: DSButtonIconSize.medium,
        buttonPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        contentSpacing: 8.0,
      );

      mockDecoration = BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
      );
    });

    Widget createTestWidget({
      DSButtonState state = DSButtonState.normal,
      String text = 'Test Button',
      String loadingText = 'Loading...',
      String? leadingIconPath,
      DSButtonIconSize? leadingIconSize,
      String? trailingIconPath,
      DSButtonIconSize? trailingIconSize,
      DSButtonSize size = DSButtonSize.large,
      Color textColor = Colors.white,
      Color? iconColor,
      Color? loadingIconColor,
    }) {
      return MaterialApp(
        home: Scaffold(
          body: DSButtonContent(
            state: state,
            text: text,
            loadingText: loadingText,
            leadingIconPath: leadingIconPath,
            leadingIconSize: leadingIconSize,
            trailingIconPath: trailingIconPath,
            trailingIconSize: trailingIconSize,
            buttonSpec: mockButtonSpec,
            size: size,
            decoration: mockDecoration,
            textColor: textColor,
            iconColor: iconColor,
            loadingIconColor: loadingIconColor,
          ),
        ),
      );
    }

    testWidgets('should display text correctly in normal state', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(text: 'Click Me', state: DSButtonState.normal),
      );

      expect(find.text('Click Me'), findsOneWidget);
      expect(find.text('Loading...'), findsNothing);
    });

    testWidgets('should display loading text when in loading state', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          text: 'Click Me',
          loadingText: 'Please wait...',
          state: DSButtonState.loading,
        ),
      );

      expect(find.text('Please wait...'), findsOneWidget);
      expect(find.text('Click Me'), findsNothing);
    });

    testWidgets('should display leading icon when provided and not loading', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          leadingIconPath: DSIcons.icClose,
          leadingIconSize: DSButtonIconSize.small,
          state: DSButtonState.normal,
        ),
      );

      final leadingIcon = find.byType(DSImage).first;
      expect(leadingIcon, findsOneWidget);

      final DSImage imageWidget = tester.widget<DSImage>(leadingIcon);
      expect(
        imageWidget.path,
        DSIcons.icClose,
      );
      expect(imageWidget.width, DSButtonIconSize.small.size);
      expect(imageWidget.height, DSButtonIconSize.small.size);
    });

    testWidgets('should display trailing icon when provided and not loading', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          trailingIconPath: DSIcons.icClose,
          trailingIconSize: DSButtonIconSize.medium,
          state: DSButtonState.normal,
        ),
      );

      final trailingIcon = find.byType(DSImage);
      expect(trailingIcon, findsOneWidget);

      final DSImage imageWidget = tester.widget<DSImage>(trailingIcon);
      expect(
        imageWidget.path,
        DSIcons.icClose,
      );
      expect(imageWidget.width, DSButtonIconSize.medium.size);
      expect(imageWidget.height, DSButtonIconSize.medium.size);
    });

    testWidgets(
      'should display loading indicator instead of trailing icon when loading',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          createTestWidget(
            trailingIconPath: 'assets/icons/arrow_right.png',
            trailingIconSize: DSButtonIconSize.medium,
            state: DSButtonState.loading,
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        expect(find.byType(DSImage), findsNothing);
      },
    );

    testWidgets(
      'should display both leading and trailing icons when not loading',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          createTestWidget(
            leadingIconPath: DSIcons.icClose,
            leadingIconSize: DSButtonIconSize.small,
            trailingIconPath: DSIcons.icClose,
            trailingIconSize: DSButtonIconSize.small,
            state: DSButtonState.normal,
          ),
        );

        expect(find.byType(DSImage), findsNWidgets(2));

        final images = tester.widgetList<DSImage>(find.byType(DSImage));
        expect(images.first.width, DSButtonIconSize.small.size);
        expect(images.first.height, DSButtonIconSize.small.size);
        expect(images.last.width, DSButtonIconSize.small.size);
        expect(images.last.height, DSButtonIconSize.small.size);
      },
    );

    testWidgets('should apply correct icon colors', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          leadingIconPath: DSIcons.icClose,
          leadingIconSize: DSButtonIconSize.medium,
          iconColor: Colors.red,
          state: DSButtonState.normal,
        ),
      );

      final DSImage imageWidget = tester.widget<DSImage>(find.byType(DSImage));
      expect(imageWidget.color, Colors.red);
      expect(imageWidget.width, DSButtonIconSize.medium.size);
    });

    testWidgets('should apply correct loading icon color', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          state: DSButtonState.loading,
          loadingIconColor: Colors.green,
          trailingIconSize: DSButtonIconSize.medium,
        ),
      );

      final CircularProgressIndicator progressIndicator = tester
          .widget<CircularProgressIndicator>(
            find.byType(CircularProgressIndicator),
          );

      expect(
        progressIndicator.valueColor,
        isA<AlwaysStoppedAnimation<Color>>(),
      );
      final AlwaysStoppedAnimation<Color> valueColor =
          progressIndicator.valueColor as AlwaysStoppedAnimation<Color>;
      expect(valueColor.value, Colors.green);

      final SizedBox sizedBox = tester.widget<SizedBox>(
        find.ancestor(
          of: find.byType(CircularProgressIndicator),
          matching: find.byType(SizedBox),
        ),
      );
      expect(sizedBox.width, DSButtonIconSize.medium.size);
      expect(sizedBox.height, DSButtonIconSize.medium.size);
    });

    testWidgets('should use default loading icon color when not specified', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          state: DSButtonState.loading,
          trailingIconSize: DSButtonIconSize.medium,
        ),
      );

      final CircularProgressIndicator progressIndicator = tester
          .widget<CircularProgressIndicator>(
            find.byType(CircularProgressIndicator),
          );

      expect(progressIndicator.valueColor, isNull);

      final SizedBox sizedBox = tester.widget<SizedBox>(
        find.ancestor(
          of: find.byType(CircularProgressIndicator),
          matching: find.byType(SizedBox),
        ),
      );
      expect(sizedBox.width, DSButtonIconSize.medium.size);
      expect(sizedBox.height, DSButtonIconSize.medium.size);
    });

    testWidgets('should apply correct text color', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(textColor: Colors.purple));

      final DSText textWidget = tester.widget<DSText>(find.byType(DSText));
      expect(textWidget.textColor, Colors.purple);
    });

    testWidgets('should apply correct button spec padding and spacing', (
      WidgetTester tester,
    ) async {
      const customButtonSpec = DSButtonSpec(
        buttonHeight: 56.0,
        buttonIconSize: DSButtonIconSize.large,
        buttonPadding: EdgeInsets.all(20),
        contentSpacing: 12.0,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSButtonContent(
              state: DSButtonState.normal,
              text: 'Test',
              loadingText: 'Loading...',
              leadingIconPath: null,
              leadingIconSize: null,
              trailingIconPath: null,
              trailingIconSize: null,
              buttonSpec: customButtonSpec,
              size: DSButtonSize.large,
              decoration: mockDecoration,
              textColor: Colors.white,
            ),
          ),
        ),
      );

      final AnimatedContainer container = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );
      expect(container.padding, const EdgeInsets.all(20));

      final Row row = tester.widget<Row>(find.byType(Row));
      expect(row.spacing, 12.0);
    });

    testWidgets('should apply correct decoration', (WidgetTester tester) async {
      final customDecoration = BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(16),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSButtonContent(
              state: DSButtonState.normal,
              text: 'Test',
              loadingText: 'Loading...',
              leadingIconPath: null,
              leadingIconSize: null,
              trailingIconPath: null,
              trailingIconSize: null,
              buttonSpec: mockButtonSpec,
              size: DSButtonSize.large,
              decoration: customDecoration,
              textColor: Colors.white,
            ),
          ),
        ),
      );

      final AnimatedContainer container = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );
      expect(container.decoration, customDecoration);
    });

    testWidgets('should have correct animation properties', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final AnimatedContainer container = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );
      expect(container.duration, const Duration(milliseconds: 150));
      expect(container.curve, Curves.easeInOut);
    });

    testWidgets('should apply correct icon sizes from enum', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          leadingIconPath: DSIcons.icClose,
          leadingIconSize: DSButtonIconSize.large,
          trailingIconPath: DSIcons.icClose,
          trailingIconSize: DSButtonIconSize.extraSmall,
          state: DSButtonState.normal,
        ),
      );

      final images = tester.widgetList<DSImage>(find.byType(DSImage));
      expect(images.first.width, DSButtonIconSize.large.size);
      expect(images.last.width, DSButtonIconSize.extraSmall.size);
    });

    testWidgets('should apply correct loading indicator size', (
      WidgetTester tester,
    ) async {
      final iconSize = DSButtonIconSize.large;

      await tester.pumpWidget(
        createTestWidget(
          trailingIconSize: iconSize,
          state: DSButtonState.loading,
        ),
      );

      final SizedBox sizedBox = tester.widget<SizedBox>(
        find.ancestor(
          of: find.byType(CircularProgressIndicator),
          matching: find.byType(SizedBox),
        ),
      );
      expect(sizedBox.width, iconSize.size);
      expect(sizedBox.height, iconSize.size);
    });

    testWidgets('should handle null icon paths gracefully', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          leadingIconPath: null,
          trailingIconPath: null,
          state: DSButtonState.normal,
        ),
      );

      expect(find.byType(DSImage), findsNothing);
      expect(find.byType(DSText), findsOneWidget);
    });

    testWidgets('should handle disabled state', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          state: DSButtonState.disabled,
          text: 'Disabled Button',
        ),
      );

      expect(find.text('Disabled Button'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('should apply correct text style and properties', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget(text: 'Test Text'));

      final DSText textWidget = tester.widget<DSText>(find.byType(DSText));
      expect(textWidget.textStyle, DSTextStyleType.primaryButtonLRegular);
      expect(textWidget.textAlign, TextAlign.center);
      expect(textWidget.overflow, TextOverflow.ellipsis);
    });

    testWidgets('should wrap text in Flexible widget', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final Flexible flexibleWidget = tester.widget<Flexible>(
        find.ancestor(of: find.byType(DSText), matching: find.byType(Flexible)),
      );
      expect(flexibleWidget, isNotNull);
    });

    testWidgets('should configure Row widget correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final Row rowWidget = tester.widget<Row>(find.byType(Row));
      expect(rowWidget.mainAxisAlignment, MainAxisAlignment.center);
      expect(rowWidget.mainAxisSize, MainAxisSize.min);
    });

    testWidgets('should configure CircularProgressIndicator correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          state: DSButtonState.loading,
          trailingIconSize: DSButtonIconSize.medium,
        ),
      );

      final CircularProgressIndicator progressIndicator = tester
          .widget<CircularProgressIndicator>(
            find.byType(CircularProgressIndicator),
          );

      expect(progressIndicator.strokeWidth, 4);
      expect(progressIndicator.strokeCap, StrokeCap.round);
    });
  });
}
