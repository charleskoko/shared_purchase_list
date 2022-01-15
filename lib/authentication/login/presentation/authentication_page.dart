import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_purchase_list/authentication/login/application/login_cubit.dart';
import 'package:shared_purchase_list/core/presentation/widgets/design_widgets/custom_email_text_field.dart';
import 'package:shared_purchase_list/core/presentation/widgets/design_widgets/custom_notification.dart';
import 'package:shared_purchase_list/core/presentation/widgets/design_widgets/custom_password_text_field.dart';
import 'package:shared_purchase_list/core/presentation/widgets/design_widgets/rounded_button.dart';
import 'package:shared_purchase_list/core/shared/colors.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);
  static final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreenColor,
      body: SafeArea(
          child: BlocListener<LoginCubit, LoginState>(
        listener: (context, loginState) {
          if (loginState is LoginFaillure) {
            buildFlashNotification(
              title: loginState.message,
              context: context,
              textColor: Colors.red,
            );
          } else if (loginState is LoginSuccessfully) {
            context.goNamed('home');
          }
        },
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _key,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: kBleuColor,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      const SizedBox(height: 32),
                      CustomEmailTextField(
                        label: 'Email',
                        hintext: 'Enter your email adress',
                        stringValueSetter: (value) =>
                            context.read<LoginCubit>().email = value,
                      ),
                      const SizedBox(height: 16),
                      CustomPasswordTextField(
                        label: 'Password',
                        hintext: 'Enter your password',
                        stringValueSetter: (value) =>
                            context.read<LoginCubit>().password = value,
                      ),
                      const SizedBox(height: 32),
                      RoundedButton(
                          label: 'Log in',
                          onPress: () {
                            if (_key.currentState!.validate()) {
                              _key.currentState!.save();
                              context.read<LoginCubit>().login();
                            }
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'happy to see you again. Please enjoy the list management experience that our application offers.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: kBleuColor,
                        ),
                      ),
                      Expanded(child: Container()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Do you have an account?'),
                          GestureDetector(
                            onTap: () {
                              context.goNamed('registration');
                            },
                            child: Text(
                              ' Sign up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kBleuColor,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
