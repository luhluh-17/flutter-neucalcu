import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:neucalcu/models/record.dart';
import 'package:neucalcu/providers/animate.dart';
import 'package:neucalcu/providers/calculate.dart';
import 'package:neucalcu/themes/colors.dart';
import 'package:neucalcu/themes/dimensions.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'ui/calculator/calculator_page.dart';
import 'ui/record/records_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDirectory.path);
  Hive.registerAdapter<Record>(RecordAdapter());
  await Hive.openBox<Record>(boxRecord);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Calculate()),
        ChangeNotifierProvider(create: (_) => Animate()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: _buildAppTheme(context),
      initialRoute: CalculatorPage.id,
      routes: {
        CalculatorPage.id: (context) => CalculatorPage(),
        RecordsPage.id: (context) => RecordsPage(),
      },
    );
  }

  ThemeData _buildAppTheme(BuildContext context) {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
        textTheme: _appTextTheme(
          GoogleFonts.montserratTextTheme(base.textTheme),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity);
  }

  TextTheme _appTextTheme(TextTheme base) {
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
          bodyColor: AppColors.primaryText,
          displayColor: AppColors.secondaryText,
        );
  }
}
