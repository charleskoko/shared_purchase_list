import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_purchase_list/authentication/infrastructure/authentication_repository.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final AuthenticationRepository authenticationRepository;
  RegistrationCubit({required this.authenticationRepository})
      : super(RegistrationLoadingState());

  String? email, password;
  Future<void> registration() async {
    final userOrMessage = await authenticationRepository.registration(
        email: email, password: password);
    userOrMessage.fold(
      (message) => emit(RegistrationFaillure(errorMessage: message)),
      (user) => emit(RegistrationSuccessfully()),
    );
  }
}
