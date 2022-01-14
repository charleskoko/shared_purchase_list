import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_purchase_list/authentication/core/domain/user.dart';

class FirebaseAuthenticationService {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthenticationService({required this.firebaseAuth});

  UserModel? _userFromFirebase(User? user) {
    return user != null
        ? UserModel(
            uid: user.uid,
            displayNAme: user.displayName,
            email: user.email,
          )
        : null;
  }

  Future<UserModel?> get currentUser async {
    final User? currentUser = firebaseAuth.currentUser;
    return _userFromFirebase(currentUser);
  }

  bool get isSigned {
    final User? currentUser = firebaseAuth.currentUser;
    if (currentUser == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<Either<String?, UserModel?>> signInWithCredential(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? userAuth = userCredential.user;
      return right(_userFromFirebase(userAuth));
    } on FirebaseAuthException catch (exception) {
      return left(exception.message);
    }
  }

  Future<Either<String?, UserModel?>> signUp({
    String? displayName,
    String? email,
    String? password,
  }) async {
    try {
      final UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      User? userAuth = userCredential.user;
      return right(_userFromFirebase(userAuth));
    } on FirebaseAuthException catch (exception) {
      return left(exception.message);
    }
  }

  Future<String?> signOut() async {
    try {
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (exception) {
      return exception.message;
    }
  }
}
