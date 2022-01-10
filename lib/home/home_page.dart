import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_purchase_list/authentication/login/application/login_cubit.dart';
import 'package:shared_purchase_list/core/presentation/widgets/design_widgets/rounded_button.dart';
import 'package:shared_purchase_list/core/shared/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<LoginCubit, LoginState>(listener: (context, loginState) {
            if (loginState is LoginNotLoggegIn) {
              Navigator.popUntil(context, (route) => false);
              Navigator.pushNamed(context, Routes.authentication);
            }
          })
        ],
        child: Center(
            child: RoundedButton(
          label: 'logout',
          onPress: () {
            context.read<LoginCubit>().logout();
          },
        )),
      ),
    );
  }
}
