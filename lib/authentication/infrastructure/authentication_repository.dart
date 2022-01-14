import 'package:dartz/dartz.dart';
import 'package:shared_purchase_list/authentication/core/domain/user.dart';
import 'package:shared_purchase_list/core/infratructure/firebase_authentication_service.dart';

class AuthenticationRepository {
  final FirebaseAuthenticationService firebaseAuthenticationService;

  AuthenticationRepository({required this.firebaseAuthenticationService});

  Future<Either<String?, UserModel?>> login(
      {required String email, required String password}) async {
    final userOrException = await firebaseAuthenticationService
        .signInWithCredential(email: email, password: password);
    return userOrException.fold(
      (exceptionMessage) => left(exceptionMessage),
      (user) => right(user),
    );
  }

  Future<Either<String?, UserModel?>> registration(
      {required String? email, required String? password}) async {
    final userOrException = await firebaseAuthenticationService.signUp(
        email: email, password: password);

    return userOrException.fold(
      (exceptionMessage) => left(exceptionMessage),
      (user) => right(user),
    );
  }

  Future<void> logout() async {
    await firebaseAuthenticationService.signOut();
  }

  Future<bool> isSigned() {
    return firebaseAuthenticationService.isSigned;
  }

  Future<UserModel?> currentUser() async {
    return await firebaseAuthenticationService.currentUser;
  }
}
