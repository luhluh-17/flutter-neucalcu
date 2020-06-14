import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:neucalcu/models/record.dart';
import 'package:neucalcu/providers/animate.dart';
import 'package:neucalcu/providers/calculate.dart';
import 'package:neucalcu/providers/color_provider.dart';
import 'package:neucalcu/themes/colors.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'ui/my_app.dart';

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
