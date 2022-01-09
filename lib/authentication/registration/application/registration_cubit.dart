import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:shared_purchase_list/authentication/core/domain/user.dart';
import 'package:shared_purchase_list/authentication/infrastructure/authentication_repository.dart';
import 'package:shared_purchase_list/core/shared/service_locator.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final AuthenticationRepository authenticationRepository;
  RegistrationCubit({required this.authenticationRepository})
      : super(RegistrationLoadingState());

  String? email, password;
  Future<void> registration() async {
    //final UserModel? user = await authenticationRepository.signUp(
    //  email: email,
    //  password: password,
    //);
  }
}
