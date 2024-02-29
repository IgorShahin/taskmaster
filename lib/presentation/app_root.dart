import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskmaster/data/model/task_model.dart';

import '../config/resources/app_theme.dart';
import '../config/routes/router.dart';
import '../injection_container.dart';

class AppRoot extends StatelessWidget with WidgetsBindingObserver {
  static late AppRoot instance;

  final _router = AppRouter();

  AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Task Master",
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru'),
        Locale('en'),
      ],
      theme: AppTheme.lightThemeDefault,
      routerConfig: _router.config(),
    );
  }

  Future<void> setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    Hive.registerAdapter(TaskModelAdapter());
    await initializeDependencies();
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    WidgetsBinding.instance.addObserver(this);
  }
}
