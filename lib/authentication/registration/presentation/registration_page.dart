import 'package:flutter/material.dart';
import 'package:shared_purchase_list/authentication/registration/application/registration_cubit.dart';
import 'package:shared_purchase_list/core/presentation/widgets/design_widgets/custom_email_text_field.dart';
import 'package:shared_purchase_list/core/presentation/widgets/design_widgets/custom_notification.dart';
import 'package:shared_purchase_list/core/presentation/widgets/design_widgets/custom_password_text_field.dart';
import 'package:shared_purchase_list/core/presentation/widgets/design_widgets/rounded_button.dart';
import 'package:shared_purchase_list/core/shared/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  static final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String? passwordToConfirm;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreenColor,
      body: SafeArea(
        child: BlocListener<RegistrationCubit, RegistrationState>(
          listener: (context, registrationState) {
            if (registrationState is RegistrationFaillure) {
              buildFlashNotification(
                  title: registrationState.errorMessage, context: context);
            } else if (registrationState is RegistrationSuccessfully) {
              buildFlashNotification(
                title: 'Your are sucessfully registred',
                context: context,
                textColor: Colors.green,
              );
              context.goNamed('login');
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
                            'Sign Up',
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
                          hintext: 'Enter your email adress',
                          label: 'Email',
                          stringValueSetter: (value) =>
                              context.read<RegistrationCubit>().email = value,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomPasswordTextField(
                          hintext: 'Enter your password',
                          label: 'Password',
                          stringValueSetter: (value) {
                            context.read<RegistrationCubit>().password = value;
                          },
                        ),
                        const SizedBox(height: 32),
                        RoundedButton(
                            label: 'Sign Up',
                            onPress: () {
                              if (_key.currentState!.validate()) {
                                _key.currentState!.save();
                                context
                                    .read<RegistrationCubit>()
                                    .registration();
                              }
                            }),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'By signing up, you agreed with our term of services and Privacy Policy.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kBleuColor,
                          ),
                        ),
                        Expanded(child: Container()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already have an account?'),
                            GestureDetector(
                              onTap: () {
                                context.goNamed('login');
                              },
                              child: Text(
                                ' Log in',
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
        ),
      ),
    );
  }
}
