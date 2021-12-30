import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_purchase_list/authentication/core/domain/user.dart';

class AuthenticationService {
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

  Stream<User?> get userAuthState {
    return _firebaseAuth.authStateChanges();
  }

  Future<User?> signInWithCredential(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? userAuth = userCredential.user;
      return userAuth;
    } catch (error) {
      if (kDebugMode) {
        print('sign in with credential with firebase error | $error');
      }
      return null;
    }
  }

  Future<User?> signUp({
    required String displayName,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? userAuth = userCredential.user;
      if (userAuth != null) {
        userAuth.updateDisplayName(displayName);
      }
      return userAuth;
    } catch (error) {
      if (kDebugMode) {
        print('sign up with credential with firebase error | $error');
      }
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (error) {
      if (kDebugMode) {
        print('sign up with credential with firebase error | $error');
      }
    }
  }
}
