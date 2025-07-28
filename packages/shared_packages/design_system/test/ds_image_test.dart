import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('DSImage Widget Tests', () {
    testWidgets('Renders default network image (non-SVG)', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DSImage.network(
            'https://example.com/image.png',
            placeholder: const Text('Loading...'),
            errorWidget: const Text('Error'),
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('Image.asset widget not render if pass svg path', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: DSImage.asset('assets/icons/ic_close.svg')),
      );

      expect(find.byType(Image), findsNothing);
    });

    testWidgets('Renders SvgPicture.asset if pass svg path', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: DSImage.asset('assets/icons/ic_ewg_verified.svg')),
      );

      expect(find.byType(SvgPicture), findsOneWidget);
    });

    testWidgets('Shows error widget on error', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DSImage.network(
            'invalid_url',
            errorWidget: const Text('Error Occurred'),
          ),
        ),
      );
      expect(find.text('Error Occurred'), findsNothing);
    });

    testWidgets('Renders placeholder if provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DSImage.asset(
            'fake.svg',
            placeholder: const Text('Loading...'),
          ),
        ),
      );
      expect(find.text('Loading...'), findsOneWidget);
    });

    testWidgets('Renders Image.file for non-SVG file', (
      WidgetTester tester,
    ) async {
      const testFilePath = 'test/test_image.jpg';

      await tester.pumpWidget(
        MaterialApp(
          home: DSImage.file(
            testFilePath,
            width: 100,
            height: 100,
            color: Colors.grey,
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(SvgPicture), findsNothing);
    });

    testWidgets('Renders Image.file for svg file', (WidgetTester tester) async {
      const testFilePath = 'test/test_image.svg';

      await tester.pumpWidget(
        MaterialApp(
          home: DSImage.file(
            testFilePath,
            width: 100,
            height: 100,
            color: Colors.grey,
          ),
        ),
      );

      expect(find.byType(Image), findsNothing);
      expect(find.byType(SvgPicture), findsOneWidget);
    });
  });
}
