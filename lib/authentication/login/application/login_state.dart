part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccessfully extends LoginState {
  final UserModel? user;
  LoginSuccessfully({required this.user});
}

class LoginNotLoggegIn extends LoginState {}

class LoginFaillure extends LoginState {
  final String? message;
  LoginFaillure(this.message);
}
