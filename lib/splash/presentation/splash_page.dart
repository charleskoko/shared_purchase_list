import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_purchase_list/authentication/login/application/login_cubit.dart';
import 'package:shared_purchase_list/core/shared/routes.dart';

class Splashpage extends StatelessWidget {
  const Splashpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<LoginCubit, LoginState>(listener: (context, loginState) {
            print(loginState);
            if (loginState is LoginSuccessfully) {
              Navigator.pushNamed(context, Routes.home);
            } else if (loginState is LoginNotLoggegIn) {
              Navigator.pushNamed(context, Routes.onBoarding);
            }
          })
        ],
        child: Center(child: Text('splash page')),
      ),
    );
  }
}
