import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_purchase_list/core/shared/colors.dart';

class CustomTextField extends StatelessWidget {
  final String label, hintext;
  final void Function(String? value) stringValueSetter;
  const CustomTextField({
    Key? key,
    required this.hintext,
    required this.label,
    required this.stringValueSetter,
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
        hintText: 'Enter your username',
        hintStyle: TextStyle(
          fontSize: 14,
          color: kBleuColor,
          fontWeight: FontWeight.bold,
        ),
        labelText: 'Username',
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
            Ionicons.person_outline,
            color: kBleuColor,
          ),
        ),
      ),
      onSaved: (value) => stringValueSetter(value),
      onChanged: (value) {},
    );
  }
}
