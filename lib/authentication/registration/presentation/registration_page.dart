import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_purchase_list/core/presentation/widgets/rounded_button.dart';
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
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        style: TextStyle(
                          fontSize: 14,
                          color: kBleuColor,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter your username',
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: kBleuColor,
                            fontWeight: FontWeight.bold,
                          ),
                          labelText: 'Username',
                          labelStyle:
                              TextStyle(fontSize: 14, color: kBleuColor),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                            ),
                          ),
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                            ),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                              right: 16,
                            ),
                            child: Icon(
                              Ionicons.person_outline,
                              color: kBleuColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        style: TextStyle(
                          fontSize: 14,
                          color: kBleuColor,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter your email adress',
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: kBleuColor,
                            fontWeight: FontWeight.bold,
                          ),
                          labelText: 'Email',
                          labelStyle:
                              TextStyle(fontSize: 14, color: kBleuColor),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                            ),
                          ),
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                            ),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                              right: 16,
                            ),
                            child: Icon(
                              Ionicons.mail_outline,
                              color: kBleuColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        obscureText: true,
                        style: TextStyle(
                          fontSize: 14,
                          color: kBleuColor,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: kBleuColor,
                            fontWeight: FontWeight.bold,
                          ),
                          labelText: 'Password',
                          labelStyle:
                              TextStyle(fontSize: 14, color: kBleuColor),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                            ),
                          ),
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                            ),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                              right: 16,
                            ),
                            child: Icon(
                              Ionicons.lock_closed_outline,
                              color: kBleuColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        obscureText: true,
                        style: TextStyle(
                          fontSize: 14,
                          color: kBleuColor,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Confirm your password',
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: kBleuColor,
                            fontWeight: FontWeight.bold,
                          ),
                          labelText: 'Password confirmation',
                          labelStyle:
                              TextStyle(fontSize: 14, color: kBleuColor),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                            ),
                          ),
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                            ),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                              right: 16,
                            ),
                            child: Icon(
                              Ionicons.lock_closed_outline,
                              color: kBleuColor,
                            ),
                          ),
                        ),
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
