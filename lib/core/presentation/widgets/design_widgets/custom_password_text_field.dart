import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_purchase_list/core/shared/colors.dart';

class CustomPasswordTextField extends StatefulWidget {
  final String hintext, label;
  final void Function(String? value) stringValueSetter;
  const CustomPasswordTextField({
    Key? key,
    required this.hintext,
    required this.label,
    required this.stringValueSetter,
  }) : super(key: key);

  @override
  _CustomPasswordTextFieldState createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      style: TextStyle(
        fontSize: 14,
        color: kBleuColor,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        hintText: widget.hintext,
        hintStyle: TextStyle(
          fontSize: 14,
          color: kBleuColor,
          fontWeight: FontWeight.bold,
        ),
        labelText: widget.label,
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
            Ionicons.lock_closed_outline,
            color: kBleuColor,
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              obscureText ? obscureText = false : obscureText = true;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
            ),
            child: Icon(
              obscureText ? Ionicons.eye_off_outline : Ionicons.eye_outline,
              color: kBleuColor,
            ),
          ),
        ),
      ),
      onSaved: (value) => widget.stringValueSetter(value),
      validator: (value) {},
    );
  }
}
