import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_purchase_list/authentication/infrastructure/authentication_repository.dart';
import 'package:shared_purchase_list/authentication/login/application/login_cubit.dart';
import 'package:shared_purchase_list/authentication/registration/application/registration_cubit.dart';
import 'package:shared_purchase_list/core/presentation/widgets/app_router.dart';
import 'package:shared_purchase_list/core/shared/colors.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoginCubit>(
              create: (context) => LoginCubit(
                  authenticationRepository: AuthenticationRepository())),
          BlocProvider<RegistrationCubit>(
              create: (context) => RegistrationCubit(
                  authenticationRepository: AuthenticationRepository())),
        ],
        child: MaterialApp(
          title: 'Shared Purshases List',
          theme: ThemeData(
            fontFamily: 'jost-regular',
            primaryColor: kPurpilColor,
          ),
          onGenerateRoute: appRouter.onGenerateRoute,
        ));
  }
}
