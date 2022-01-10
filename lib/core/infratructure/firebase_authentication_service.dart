import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_purchase_list/authentication/core/domain/user.dart';

class FirebaseAuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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
    final User? currentUser = _firebaseAuth.currentUser;
    return _userFromFirebase(currentUser);
  }

  Future<bool> get isSigned async {
    final User? currentUser = _firebaseAuth.currentUser;
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
          await _firebaseAuth.signInWithEmailAndPassword(
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
          await _firebaseAuth.createUserWithEmailAndPassword(
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
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (exception) {
      return exception.message;
    }
  }
}
