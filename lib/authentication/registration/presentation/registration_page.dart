import 'package:flutter/material.dart';
import 'package:shared_purchase_list/core/presentation/widgets/design_widgets/custom_email_text_field.dart';
import 'package:shared_purchase_list/core/presentation/widgets/design_widgets/custom_password_text_field.dart';
import 'package:shared_purchase_list/core/presentation/widgets/design_widgets/custom_text_field.dart';
import 'package:shared_purchase_list/core/presentation/widgets/design_widgets/rounded_button.dart';
import 'package:shared_purchase_list/core/shared/colors.dart';

class RegistrationPage extends StatelessWidget {
  static final GlobalKey<FormState> _key = GlobalKey<FormState>();

  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreenColor,
      body: SafeArea(
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
                      CustomTextField(
                        label: 'Username',
                        hintext: 'Enter your username',
                        stringValueSetter: (value) => print(value),
                      ),
                      const SizedBox(height: 16),
                      CustomEmailTextField(
                        stringValueSetter: (value) => print(value),
                        hintext: 'Enter your email adress',
                        label: 'Email',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomPasswordTextField(
                        stringValueSetter: (value) => print(value),
                        hintext: 'Enter your password',
                        label: 'Password',
                      ),
                      const SizedBox(height: 16),
                      CustomEmailTextField(
                        stringValueSetter: (value) => print(value),
                        hintext: 'Confirm your password',
                        label: 'Password confrimation',
                      ),
                      const SizedBox(height: 32),
                      RoundedButton(label: 'Sign Up', onPress: () {}),
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
                              Navigator.pop(context);
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
    );
  }
}
