import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FirebaseRepo {
  Future<void> init() async {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: dotenv.get('FIREBASE_API_KEY'),
            appId: dotenv.get('FIREBASE_APP_ID'),
            messagingSenderId: dotenv.get('FIREBASE_MESSAGING_SENDER_ID'),
            projectId: dotenv.get('FIREBASE_PROJECT_ID')));
  }

  Future<UserCredential> signIn(String email, String password) async =>
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
}
