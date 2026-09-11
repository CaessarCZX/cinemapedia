import 'package:flutter/material.dart';

import 'package:cinemapedia/config/router/app_router.dart';
import 'package:cinemapedia/config/theme/app_theme.dart';
import 'package:cinemapedia/config/constants/envieronment_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _validateEnvironment();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().theme,
    );
  }
}

void _validateEnvironment() {
  if (!EnvieronmentConfig.isConfigured) {
    throw Exception(
      '\n\n❌ CONFIGURATION ERROR:\n'
      'Critical variables are missing.\n'
      'Ensure to execute --dart-define-from-file when running debug or build in app.\n',
    );
  }
}
