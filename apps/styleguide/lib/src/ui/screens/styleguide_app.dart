import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:styleguide/l10n/styleguide_localizations.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:styleguide/src/ui/screens/styleguide_app.directories.g.dart';

@widgetbook.App()
class StyleguideApp extends StatelessWidget {
  const StyleguideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      appBuilder:
          (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: dsTheme,
            localizationsDelegates:
                StyleguideLocalizations.localizationsDelegates,
            supportedLocales: StyleguideLocalizations.supportedLocales,
            home: Material(child: child),
          ),
      directories: directories,
      addons: [
        DeviceFrameAddon(
          devices: [...Devices.android.all, ...Devices.ios.all],
          initialDevice: Devices.ios.iPhone13,
        ),
        TextScaleAddon(min: 1.0, max: 2.0),
        BuilderAddon(
          name: "default builder",
          builder: (context, child) {
            return SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(color: Colors.white, child: child),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
