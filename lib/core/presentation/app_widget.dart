import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_purchase_list/authentication/infrastructure/authentication_repository.dart';
import 'package:shared_purchase_list/authentication/login/application/login_cubit.dart';
import 'package:shared_purchase_list/authentication/login/presentation/authentication_page.dart';
import 'package:shared_purchase_list/authentication/registration/application/registration_cubit.dart';
import 'package:shared_purchase_list/authentication/registration/presentation/registration_page.dart';
import 'package:shared_purchase_list/core/infratructure/firebase_authentication_service.dart';
import 'package:shared_purchase_list/core/shared/colors.dart';
import 'package:shared_purchase_list/home/home_page.dart';
import 'package:shared_purchase_list/on_boarding/on_boarding_page.dart';
import 'package:shared_purchase_list/splash/presentation/splash_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(
          name: 'registration',
          path: '/registration',
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const RegistrationPage(),
          ),
        ),
        GoRoute(
          name: 'splash',
          path: '/',
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const Splashpage(),
          ),
        ),
        GoRoute(
          name: 'on-boarding',
          path: '/on-boarding',
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const OnBoardingPage(),
          ),
        ),
        GoRoute(
          name: 'home',
          path: '/home',
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const HomePage(),
          ),
        ),
        GoRoute(
          name: 'login',
          path: '/login',
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const AuthenticationPage(),
          ),
        )
      ],
      errorPageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const Scaffold(
            body: Center(
          child: Text(
            "Error page",
          ),
        )),
      ),
    );
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => FirebaseAuthenticationService(
              firebaseAuth: FirebaseAuth.instance),
        ),
        RepositoryProvider(
          create: (context) => AuthenticationRepository(
            firebaseAuthenticationService:
                context.read<FirebaseAuthenticationService>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(
              authenticationRepository:
                  context.read<AuthenticationRepository>(),
            ),
          ),
          BlocProvider<RegistrationCubit>(
            create: (context) => RegistrationCubit(
              authenticationRepository:
                  context.read<AuthenticationRepository>(),
            ),
          ),
        ],
        child: MaterialApp.router(
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          title: 'Shared Purshases List',
          theme: ThemeData(
            fontFamily: 'jost-regular',
            primaryColor: kPurpilColor,
          ),
        ),
      ),
    );
  }
}
