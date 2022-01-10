import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_purchase_list/authentication/core/domain/user.dart';
import 'package:shared_purchase_list/core/infratructure/firebase_authentication_service.dart';
import 'package:shared_purchase_list/core/shared/service_locator.dart';

class AuthenticationRepository {
  final FirebaseAuthenticationService _firebaseAuthenticationService =
      getIt<FirebaseAuthenticationService>();

  Future<Either<String?, UserModel?>> login(
      {required String email, required String password}) async {
    final userOrException = await _firebaseAuthenticationService
        .signInWithCredential(email: email, password: password);
    print(userOrException);
    return userOrException.fold(
      (exceptionMessage) => left(exceptionMessage),
      (user) => right(user),
    );
  }

  Future<Either<String?, UserModel?>> registration(
      {required String? email, required String? password}) async {
    final userOrException = await _firebaseAuthenticationService.signUp(
        email: email, password: password);

    return userOrException.fold(
      (exceptionMessage) => left(exceptionMessage),
      (user) => right(user),
    );
  }

  Future<String?> logout() async {
    final String? errorOrNothing =
        await _firebaseAuthenticationService.signOut();
    return errorOrNothing;
  }

  Future<bool> isSigned() async {
    return await _firebaseAuthenticationService.isSigned;
  }

  Future<UserModel?> currentUser() async {
    return await _firebaseAuthenticationService.currentUser;
  }
}
