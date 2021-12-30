import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_purchase_list/core/presentation/widgets/design_widgets/custom_email_text_field.dart';
import 'package:shared_purchase_list/core/presentation/widgets/design_widgets/custom_password_text_field.dart';
import 'package:shared_purchase_list/core/presentation/widgets/design_widgets/rounded_button.dart';
import 'package:shared_purchase_list/core/shared/colors.dart';
import 'package:shared_purchase_list/core/shared/routes.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);
  static final GlobalKey<FormState> _key = GlobalKey<FormState>();
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
                        stringValueSetter: (value) => print(value),
                      ),
                      const SizedBox(height: 16),
                      CustomPasswordTextField(
                        label: 'Password',
                        hintext: 'Enter your password',
                        stringValueSetter: (value) => print(value),
                      ),
                      const SizedBox(height: 32),
                      RoundedButton(label: 'Log in', onPress: () {}),
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
                              Navigator.pushNamed(context, Routes.registration);
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
      ),
    );
  }
}
