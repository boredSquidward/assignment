import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../data/repository/firebase_repo.dart';
import '../dependency_injection/di.dart';
import '../dependency_injection/locator.dart';

class AppInitializations {
  final DependencyInjections di;

  AppInitializations(this.di);

  void _ensureFlutterInitialized() {
    WidgetsFlutterBinding.ensureInitialized();
  }

  Future<void> _loadEnvFiles() async {
    await dotenv.load(fileName: '.env');
  }

  void _initializeDependencies(){
    di.initFirebaseApis();
    di.initSecureStorage();
    di.initRepositories();
    di.initUseCases();
    di.initBlocs();
  }

  Future<void> _initializeFirebase() async {
    await locator<FirebaseRepo>().init();
  }

  Future<void> init() async {
    _ensureFlutterInitialized();
    _initializeDependencies();
    await _loadEnvFiles();
    await _initializeFirebase();
  }
}
