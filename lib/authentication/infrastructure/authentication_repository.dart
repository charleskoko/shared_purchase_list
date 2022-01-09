import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_purchase_list/authentication/core/domain/user.dart';
import 'package:shared_purchase_list/core/infratructure/firebase_authentication_service.dart';
import 'package:shared_purchase_list/core/shared/service_locator.dart';

class AuthenticationRepository {
  final FirebaseAuthenticationService _firebaseAuthenticationService =
      getIt<FirebaseAuthenticationService>();

  Future<Either<String, UserModel?>> login(
      {required String email, required String password}) async {
    try {
      final UserModel? user = await _firebaseAuthenticationService
          .signInWithCredential(email: email, password: password);
      return right(user);
    } catch (error) {
      return left(error.toString());
    }
  }

  Future<Either<String, UserModel?>> registration(
      {required String email, required String password}) async {
    try {
      final UserModel? user = await _firebaseAuthenticationService.signUp(
          email: email, password: password);
      return right(user);
    } catch (error) {
      return left(error.toString());
    }
  }

  Future<String?> logout() async {
    try {
      _firebaseAuthenticationService.signOut();
    } catch (error) {
      return error.toString();
    }
  }

  Stream<User?> isUserAuthenticate() {
    return _firebaseAuthenticationService.userAuthState;
  }
}
