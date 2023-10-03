import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_tech_test/config/theme/app_theme.dart';
import 'package:movies_tech_test/module.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Movies Endpoint App",
      routerConfig: Modular.routerConfig,
      theme: AppTheme().themeData,
    );
  }
}
