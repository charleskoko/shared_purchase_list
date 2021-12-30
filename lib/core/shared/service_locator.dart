import 'package:get_it/get_it.dart';
import 'package:shared_purchase_list/authentication/core/infrastructure/authentication_service.dart';

final getIt = GetIt.instance;

setUpServiceLocator() {
  getIt.registerLazySingleton(() => AuthenticationService());
}
