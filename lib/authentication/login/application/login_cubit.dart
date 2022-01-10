import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:shared_purchase_list/authentication/core/domain/user.dart';
import 'package:shared_purchase_list/authentication/infrastructure/authentication_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthenticationRepository authenticationRepository;
  LoginCubit({
    required this.authenticationRepository,
  }) : super(LoginInitial()) {
    isUserAuthenticated();
  }

  String? email, password;

  Future<void> isUserAuthenticated() async {
    print('checking the if the user is already logged in');
    final bool isSigned = await authenticationRepository.isSigned();
    if (isSigned) {
      final UserModel? user = await authenticationRepository.currentUser();
      emit(LoginSuccessfully(user: user));
    } else {
      emit(LoginNotLoggegIn());
    }
  }

  Future<void> login() async {
    print('email: $email, password: $password');
    emit(LoginLoading());
    final loginOrFailure = await authenticationRepository.login(
        email: email ?? 'empty@email.com', password: password ?? 'empty');
    loginOrFailure.fold(
      (message) => emit(LoginFaillure(message)),
      (user) => emit(LoginSuccessfully(user: user)),
    );
  }

  Future<void> logout() async {
    final logoutOrFailure = authenticationRepository.logout();
    emit(LoginNotLoggegIn());
  }
}
