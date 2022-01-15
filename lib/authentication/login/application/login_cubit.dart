import 'package:bloc/bloc.dart';
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

  String? email;
  String? password;

  Future<void> isUserAuthenticated() async {
    final bool isSigned = authenticationRepository.isSigned();
    if (isSigned) {
      final UserModel? user = await authenticationRepository.currentUser();
      emit(LoginSuccessfully(user: user));
    } else {
      emit(LoginNotLoggegIn());
    }
  }

  Future<void> login() async {
    emit(LoginLoading());
    final loginOrFailure = await authenticationRepository.login(
        email: email ?? 'empty@email.com', password: password ?? 'empty');
    loginOrFailure.fold(
      (message) => emit(LoginFaillure(message)),
      (user) => emit(LoginSuccessfully(user: user)),
    );
  }

  Future<void> logout() async {
    await authenticationRepository.logout();
    emit(LoginNotLoggegIn());
  }
}
