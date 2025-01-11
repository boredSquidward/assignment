import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseRepo {
  Future<void> init() async {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyC3DVfBIYKs-EbQpA7k7E7UdLK5ILQgZ9k',
            appId: '1:898371880955:web:6a55633646d58e12bded5e',
            messagingSenderId: '898371880955',
            projectId: 'mylorry-org'));
  }

  Future<UserCredential> signIn(String email, String password) async =>
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
}
