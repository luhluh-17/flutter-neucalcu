import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:neucalcu/models/record.dart';
import 'package:neucalcu/providers/animate.dart';
import 'package:neucalcu/providers/calculate.dart';
import 'package:neucalcu/providers/color_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'ui/calculator/calculator_page.dart';
import 'ui/record/records_page.dart';
import 'ui/setting/settings_page.dart';
import 'ui/widgets/constant/colors.dart';
import 'ui/widgets/constant/dimensions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeHive();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Calculate()),
        ChangeNotifierProvider(create: (_) => Animate()),
        ChangeNotifierProvider(create: (_) => ColorProvider()),
      ],
      child: MyApp(),
    ),
  );
}

_initializeHive() async {
  final appDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDirectory.path);
  Hive.registerAdapter<Record>(RecordAdapter());
  await Hive.openBox<Record>(boxRecord);
  final box = await Hive.openBox(boxColor);
  if (box.length == 0) {
    print('Initialize Default Color Value');
    box.put('primary', AppColors.primary.value);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NeuCalcu',
      debugShowCheckedModeBanner: false,
      theme: _buildAppTheme(context),
      initialRoute: CalculatorPage.id,
      routes: {
        CalculatorPage.id: (context) => CalculatorPage(),
        RecordsPage.id: (context) => RecordsPage(),
        SettingsPage.id: (context) => SettingsPage(),
      },
    );
  }

  ThemeData _buildAppTheme(BuildContext context) {
    final provider = context.watch<ColorProvider>();
    Color primary = provider.primary;
    Color primaryLight = provider.primaryLight;
    Color primaryDark = provider.primaryDark;
    Color accent = AppColors.accent;
    bool isDarkMode = provider.darkMode;
    final ThemeData base = isDarkMode ? ThemeData.light() : ThemeData.dark();

    return base.copyWith(
        primaryColor: primary,
        accentColor: accent,
        scaffoldBackgroundColor: primary,
        primaryColorLight: primaryLight,
        primaryColorDark: primaryDark,
        textTheme: _appTextTheme(
          context,
          GoogleFonts.montserratTextTheme(base.textTheme),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity);
  }

  TextTheme _appTextTheme(BuildContext context, TextTheme base) {
    bool _isDarkMode = context.watch<ColorProvider>().darkMode;

    return base
        .copyWith(
          headline1: base.headline1.copyWith(fontSize: sizeHeadline1),
          headline2: base.headline2.copyWith(fontSize: sizeHeadline2),
          headline3: base.headline3.copyWith(fontSize: sizeHeadline3),
          headline4: base.headline4.copyWith(fontSize: sizeHeadline4),
          headline5: base.headline5.copyWith(fontSize: sizeHeadline5),
          headline6: base.headline6.copyWith(fontSize: sizeHeadline6),
          subtitle1: base.subtitle1.copyWith(fontSize: sizeSubtitle1),
          subtitle2: base.subtitle2.copyWith(fontSize: sizeSubtitle2),
          bodyText1: base.bodyText1.copyWith(fontSize: sizeBody1),
          bodyText2: base.bodyText2.copyWith(fontSize: sizeBody2),
          caption: base.caption.copyWith(fontSize: sizeCaption),
        )
        .apply(
          bodyColor: _isDarkMode
              ? AppColors.darkSecondaryText
              : AppColors.lightSecondaryText,
          displayColor: _isDarkMode
              ? AppColors.darkPrimaryText.withOpacity(0.8)
              : AppColors.lightPrimaryText.withOpacity(0.8),
        );
  }
}
