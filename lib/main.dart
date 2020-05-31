import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:neucalcu/models/record.dart';
import 'package:neucalcu/pages/calculator_page.dart';
import 'package:neucalcu/pages/records_page.dart';
import 'package:neucalcu/providers/calculate.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDirectory = await path.getApplicationDocumentsDirectory();
  Hive.init(appDirectory.path);
  Hive.registerAdapter<Record>(RecordAdapter());
  await Hive.openBox<Record>('records');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Calculate()),
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
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: CalculatorPage.id,
      routes: {
        CalculatorPage.id : (context) => CalculatorPage(),
        RecordsPage.id : (context) => RecordsPage(),
      },
    );
  }
}
