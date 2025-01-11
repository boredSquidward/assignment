import 'package:flutter/material.dart';
import 'package:tug_assessment/ui/routes/routes.dart';

import 'core/dependency_injection/di.dart';
import 'core/dependency_injection/locator.dart';
import 'data/repository/firebase_repo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final di = DependencyInjections();
  di.initFirebaseApis();
  await locator<FirebaseRepo>().init();
  di.initSecureStorage();
  di.initRepositories();
  di.initUseCases();
  di.initBlocs();

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
