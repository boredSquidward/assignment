import 'package:flutter/material.dart';
import 'package:tug_assessment/ui/routes/routes.dart';

import 'core/app_inits/app_initializations.dart';
import 'core/dependency_injection/di.dart';

Future<void> main() async {
  final di = DependencyInjections();
  await AppInitializations(di).init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TUG Assessment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: routes,
    );
  }
}
