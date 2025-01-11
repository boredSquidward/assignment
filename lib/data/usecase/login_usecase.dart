import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../repository/firebase_repo.dart';
import '../repository/secure_storage_repo.dart';

class LoginUseCase {
  final FirebaseRepo firebaseAPIs;
  final SecureStorageRepo secureStorageRepo;

  LoginUseCase(this.firebaseAPIs, this.secureStorageRepo);

  Future<Either<UserCredential, Exception>> callSignIn(
      String email, String password) async {
    try {
      var res = await firebaseAPIs.signIn(email, password);
      final token = await res.user!.getIdToken();
      await secureStorageRepo.write('token', token);
      return Left(res);
    } on FirebaseAuthException catch (e) {
      return Right(Exception('${e.message}'));
    } catch (e) {
      return Right(Exception('$e'));
    }
  }
}
