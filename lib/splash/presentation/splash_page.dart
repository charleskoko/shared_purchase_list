import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_purchase_list/authentication/login/application/login_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_purchase_list/authentication/registration/application/registration_cubit.dart';

class Splashpage extends StatelessWidget {
  const Splashpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<LoginCubit, LoginState>(
            listener: (context, loginState) {
              if (loginState is LoginSuccessfully) {
                context.goNamed('home');
              } else if (loginState is LoginNotLoggegIn) {
                context.goNamed('on-boarding');
              }
            },
          ),
          BlocListener<RegistrationCubit, RegistrationState>(
            listener: (context, loginState) {},
          )
        ],
        child: const Center(child: Text('splash page')),
      ),
    );
  }
}
