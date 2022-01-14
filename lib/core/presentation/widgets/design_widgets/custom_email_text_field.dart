import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_purchase_list/core/shared/colors.dart';
import 'package:shared_purchase_list/core/shared/validator.dart';

class CustomEmailTextField extends StatelessWidget {
  final String hintext, label;
  final void Function(String? value) stringValueSetter;
  const CustomEmailTextField({
    Key? key,
    required this.stringValueSetter,
    required this.hintext,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      style: TextStyle(
        fontSize: 14,
        color: kBleuColor,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        hintText: hintext,
        hintStyle: TextStyle(
          fontSize: 14,
          color: kBleuColor,
          fontWeight: FontWeight.bold,
        ),
        labelText: label,
        labelStyle: TextStyle(fontSize: 14, color: kBleuColor),
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
      onSaved: (value) => stringValueSetter(value),
      validator: (value) {
        return Validator.emailValidator(value!);
      },
    );
  }
}