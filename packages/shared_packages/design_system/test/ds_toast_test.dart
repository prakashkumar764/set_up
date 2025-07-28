import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DSToast Widget Tests', () {
    testWidgets('Renders title and caption', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: dsTheme,
          home: DSToast(title: 'Hello World', caption: 'Toast Caption'),
        ),
      );

      expect(find.text('Hello World'), findsOneWidget);
      expect(find.text('Toast Caption'), findsOneWidget);
    });

    testWidgets('Shows close icon and handles tap', (tester) async {
      bool dismissed = false;

      await tester.pumpWidget(
        MaterialApp(
          theme: dsTheme,
          home: DSToast(
            title: 'Dismiss Test',
            showClose: true,
            onDismissToast: () {
              dismissed = true;
            },
          ),
        ),
      );

      final closeButton = find.byType(GestureDetector);
      expect(closeButton, findsOneWidget);

      await tester.tap(closeButton);
      expect(dismissed, true);
    });

    testWidgets('Hides close icon when showClose is false', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: dsTheme,
          home: DSToast(title: 'No Close', showClose: false),
        ),
      );

      expect(find.byType(GestureDetector), findsNothing);
    });

    testWidgets('Render dark style theme', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: dsTheme,
          home: DSToast(
            title: 'Dark Toast',
            caption: 'Dark Caption',
            toastStyle: DSToastStyle.dark,
          ),
        ),
      );

      BuildContext context = tester.element(find.byType(DSToast));

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(DSToast),
          matching: find.byType(Container),
        ),
      );
      final BoxDecoration? decoration = container.decoration as BoxDecoration?;
      final Color? actualColor = decoration?.color;
      final expectedColorContainer = context.dsColors.surfacePrimaryDefault;

      expect(actualColor, expectedColorContainer);

      final textTitle = tester.widget<DSText>(find.byType(DSText).first);
      final expectedColor = context.dsColors.textOnSurfaceDefault;
      expect(textTitle.textColor, expectedColor);
      final textCaption = tester.widget<DSText>(find.byType(DSText).first);
      final expectedColorCaption = context.dsColors.textOnSurfaceDefault;
      expect(textCaption.textColor, expectedColorCaption);
    });

    testWidgets('Render light style theme', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: dsTheme,
          home: DSToast(title: 'Light Toast', caption: 'Light Caption'),
        ),
      );

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(DSToast),
          matching: find.byType(Container),
        ),
      );
      BuildContext context = tester.element(find.byType(DSToast));

      final BoxDecoration? decoration = container.decoration as BoxDecoration?;
      final Color? actualColor = decoration?.color;
      final expectedColorContainer =
          dsTheme
              .extension<DSColorThemeExtension>()!
              .surfaceNeutralBackgroundWhite;

      expect(actualColor, expectedColorContainer);

      final textTitle = tester.widget<DSText>(find.byType(DSText).first);
      final expectedColor = context.dsColors.textNeutralOnWhite;
      expect(textTitle.textColor, expectedColor);
      final textCaption = tester.widget<DSText>(find.byType(DSText).first);
      final expectedColorCaption = context.dsColors.textNeutralOnWhite;
      expect(textCaption.textColor, expectedColorCaption);
    });

    testWidgets('Renders icon if provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: dsTheme,
          home: DSToast(
            title: 'Toast Title',
            leadingIconPath: 'assets/icon.svg',
            showClose: false,
          ),
        ),
      );

      expect(find.byType(SvgPicture), findsOneWidget);
    });

    testWidgets('Renders button and triggers callback', (tester) async {
      bool buttonPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          theme: dsTheme,
          home: Scaffold(
            body: DSToast(
              title: 'With Button',
              onButtonTap: () {
                buttonPressed = true;
              },
              buttonText: 'Retry',
            ),
          ),
        ),
      );

      final button = find.byType(DSButtonPrimary);
      expect(button, findsOneWidget);

      await tester.tap(button);
      expect(buttonPressed, true);
    });
  });
}
