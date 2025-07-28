import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'styleguide_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of StyleguideLocalizations
/// returned by `StyleguideLocalizations.of(context)`.
///
/// Applications need to include `StyleguideLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/styleguide_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: StyleguideLocalizations.localizationsDelegates,
///   supportedLocales: StyleguideLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the StyleguideLocalizations.supportedLocales
/// property.
abstract class StyleguideLocalizations {
  StyleguideLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static StyleguideLocalizations? of(BuildContext context) {
    return Localizations.of<StyleguideLocalizations>(context, StyleguideLocalizations);
  }

  static const LocalizationsDelegate<StyleguideLocalizations> delegate = _StyleguideLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @styleguide_text_label.
  ///
  /// In en, this message translates to:
  /// **'text'**
  String get styleguide_text_label;

  /// No description provided for @dsText_sampleText_value.
  ///
  /// In en, this message translates to:
  /// **'Sample Text'**
  String get dsText_sampleText_value;

  /// No description provided for @dsText_textColor_label.
  ///
  /// In en, this message translates to:
  /// **'textColor'**
  String get dsText_textColor_label;

  /// No description provided for @dsText_helloWorldFromDsText.
  ///
  /// In en, this message translates to:
  /// **'Hello World from DSText!'**
  String get dsText_helloWorldFromDsText;

  /// No description provided for @dsText_textStyle_label.
  ///
  /// In en, this message translates to:
  /// **'textStyle'**
  String get dsText_textStyle_label;

  /// No description provided for @dsText_textAlign_label.
  ///
  /// In en, this message translates to:
  /// **'textAlign'**
  String get dsText_textAlign_label;

  /// No description provided for @dsText_maxLines_label.
  ///
  /// In en, this message translates to:
  /// **'maxLines'**
  String get dsText_maxLines_label;

  /// No description provided for @dsText_overflow_label.
  ///
  /// In en, this message translates to:
  /// **'overflow'**
  String get dsText_overflow_label;

  /// No description provided for @dsText_italicTextColor_label.
  ///
  /// In en, this message translates to:
  /// **'italicTextColor'**
  String get dsText_italicTextColor_label;

  /// No description provided for @dsText_firstPartText_label.
  ///
  /// In en, this message translates to:
  /// **'firstPartText'**
  String get dsText_firstPartText_label;

  /// No description provided for @dsText_thisIs_value.
  ///
  /// In en, this message translates to:
  /// **'This is'**
  String get dsText_thisIs_value;

  /// No description provided for @dsText_boldPartText_label.
  ///
  /// In en, this message translates to:
  /// **'boldPartText'**
  String get dsText_boldPartText_label;

  /// No description provided for @dsText_redText_value.
  ///
  /// In en, this message translates to:
  /// **' red text'**
  String get dsText_redText_value;

  /// No description provided for @dsText_thirdPartText_label.
  ///
  /// In en, this message translates to:
  /// **'thirdPartText'**
  String get dsText_thirdPartText_label;

  /// No description provided for @dsText_andThisIs_value.
  ///
  /// In en, this message translates to:
  /// **', and this is '**
  String get dsText_andThisIs_value;

  /// No description provided for @dsText_italicPartText_label.
  ///
  /// In en, this message translates to:
  /// **'italicPartText'**
  String get dsText_italicPartText_label;

  /// No description provided for @dsText_italicText_value.
  ///
  /// In en, this message translates to:
  /// **'italic text'**
  String get dsText_italicText_value;

  /// No description provided for @dsText_finalPartText_label.
  ///
  /// In en, this message translates to:
  /// **'finalPartText'**
  String get dsText_finalPartText_label;

  /// No description provided for @dsText_backToBaseStyle_value.
  ///
  /// In en, this message translates to:
  /// **'. Back to base style.'**
  String get dsText_backToBaseStyle_value;

  /// No description provided for @styleguide_leadingIconPath_label.
  ///
  /// In en, this message translates to:
  /// **'leadingIconPath'**
  String get styleguide_leadingIconPath_label;

  /// No description provided for @styleguide_trailingIconPath_label.
  ///
  /// In en, this message translates to:
  /// **'trailingIconPath'**
  String get styleguide_trailingIconPath_label;

  /// No description provided for @styleguide_type_label.
  ///
  /// In en, this message translates to:
  /// **'type'**
  String get styleguide_type_label;

  /// No description provided for @styleguide_size_label.
  ///
  /// In en, this message translates to:
  /// **'size'**
  String get styleguide_size_label;

  /// No description provided for @styleguide_state_label.
  ///
  /// In en, this message translates to:
  /// **'state'**
  String get styleguide_state_label;

  /// No description provided for @styleguide_iconSize_label.
  ///
  /// In en, this message translates to:
  /// **'iconSize'**
  String get styleguide_iconSize_label;

  /// No description provided for @styleguide_width_label.
  ///
  /// In en, this message translates to:
  /// **'width'**
  String get styleguide_width_label;

  /// No description provided for @styleguide_button_initialText.
  ///
  /// In en, this message translates to:
  /// **'Button'**
  String get styleguide_button_initialText;

  /// No description provided for @styleguide_loadingText_label.
  ///
  /// In en, this message translates to:
  /// **'loadingText'**
  String get styleguide_loadingText_label;

  /// No description provided for @styleguide_loadingText_initialText.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get styleguide_loadingText_initialText;

  /// No description provided for @styleguide_hasLeadingIcon.
  ///
  /// In en, this message translates to:
  /// **'hasLeadingIcon'**
  String get styleguide_hasLeadingIcon;

  /// No description provided for @styleguide_hasButton_label.
  ///
  /// In en, this message translates to:
  /// **'hasButton'**
  String get styleguide_hasButton_label;

  /// No description provided for @styleguide_toast_initialText.
  ///
  /// In en, this message translates to:
  /// **'Toast'**
  String get styleguide_toast_initialText;

  /// No description provided for @styleguide_toast_caption.
  ///
  /// In en, this message translates to:
  /// **'This is a toast message caption'**
  String get styleguide_toast_caption;

  /// No description provided for @styleguide_toastStyle_label.
  ///
  /// In en, this message translates to:
  /// **'toastStyle'**
  String get styleguide_toastStyle_label;

  /// No description provided for @styleguide_showCloseIcon_label.
  ///
  /// In en, this message translates to:
  /// **'showClose'**
  String get styleguide_showCloseIcon_label;

  /// No description provided for @styleguide_buttonText_label.
  ///
  /// In en, this message translates to:
  /// **'buttonText'**
  String get styleguide_buttonText_label;

  /// No description provided for @styleguide_toggle_label.
  ///
  /// In en, this message translates to:
  /// **'label'**
  String get styleguide_toggle_label;

  /// No description provided for @styleguide_toggle_value.
  ///
  /// In en, this message translates to:
  /// **'Toggle'**
  String get styleguide_toggle_value;

  /// No description provided for @styleguide_toggleState_label.
  ///
  /// In en, this message translates to:
  /// **'value'**
  String get styleguide_toggleState_label;

  /// No description provided for @styleguide_toast_label.
  ///
  /// In en, this message translates to:
  /// **'title'**
  String get styleguide_toast_label;

  /// No description provided for @styleguide_toast_value.
  ///
  /// In en, this message translates to:
  /// **'Toast'**
  String get styleguide_toast_value;

  /// No description provided for @styleguide_toggle_enabled.
  ///
  /// In en, this message translates to:
  /// **'enabled'**
  String get styleguide_toggle_enabled;

  /// No description provided for @styleguide_border_width_label.
  ///
  /// In en, this message translates to:
  /// **'borderWidth'**
  String get styleguide_border_width_label;

  /// No description provided for @styleguide_icon_padding_label.
  ///
  /// In en, this message translates to:
  /// **'iconPadding'**
  String get styleguide_icon_padding_label;

  /// No description provided for @styleguide_hintText_label.
  ///
  /// In en, this message translates to:
  /// **'hintLabel'**
  String get styleguide_hintText_label;

  /// No description provided for @styleguide_search_hintText.
  ///
  /// In en, this message translates to:
  /// **'hintText'**
  String get styleguide_search_hintText;

  /// No description provided for @styleguide_backgroundColor_label.
  ///
  /// In en, this message translates to:
  /// **'backgroundColor'**
  String get styleguide_backgroundColor_label;

  /// No description provided for @styleguide_border_radius_label.
  ///
  /// In en, this message translates to:
  /// **'borderRadius'**
  String get styleguide_border_radius_label;

  /// No description provided for @styleguide_caption_label.
  ///
  /// In en, this message translates to:
  /// **'caption'**
  String get styleguide_caption_label;

  /// No description provided for @styleguide_caption_value.
  ///
  /// In en, this message translates to:
  /// **'Caption'**
  String get styleguide_caption_value;

  /// No description provided for @styleguide_hintOrInputText_value.
  ///
  /// In en, this message translates to:
  /// **'Hint or input text'**
  String get styleguide_hintOrInputText_value;

  /// No description provided for @styleguide_enabled_label.
  ///
  /// In en, this message translates to:
  /// **'enabled'**
  String get styleguide_enabled_label;

  /// No description provided for @styleguide_maxLines_label.
  ///
  /// In en, this message translates to:
  /// **'maxLines'**
  String get styleguide_maxLines_label;

  /// No description provided for @styleguide_keyboardType_label.
  ///
  /// In en, this message translates to:
  /// **'keyboardType'**
  String get styleguide_keyboardType_label;

  /// No description provided for @styleguide_disabled_label.
  ///
  /// In en, this message translates to:
  /// **'disabled'**
  String get styleguide_disabled_label;

  /// No description provided for @styleguide_selected_label.
  ///
  /// In en, this message translates to:
  /// **'selected'**
  String get styleguide_selected_label;

  /// No description provided for @styleguide_checkbox_label.
  ///
  /// In en, this message translates to:
  /// **'label'**
  String get styleguide_checkbox_label;
}

class _StyleguideLocalizationsDelegate extends LocalizationsDelegate<StyleguideLocalizations> {
  const _StyleguideLocalizationsDelegate();

  @override
  Future<StyleguideLocalizations> load(Locale locale) {
    return SynchronousFuture<StyleguideLocalizations>(lookupStyleguideLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_StyleguideLocalizationsDelegate old) => false;
}

StyleguideLocalizations lookupStyleguideLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return StyleguideLocalizationsEn();
  }

  throw FlutterError(
    'StyleguideLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
