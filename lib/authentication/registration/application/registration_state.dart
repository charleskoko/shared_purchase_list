part of 'registration_cubit.dart';

@immutable
abstract class RegistrationState {}

class RegistrationLoadingState extends RegistrationState {}

class RegistrationSuccessfully extends RegistrationState {}

class RegistrationFaillure extends RegistrationState {
  final String? errorMessage;
  RegistrationFaillure({required this.errorMessage});
}
