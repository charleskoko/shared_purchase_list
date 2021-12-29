import 'package:flutter/material.dart';
import 'package:shared_purchase_list/core/shared/colors.dart';

class RoundedButton extends StatelessWidget {
  final String label;
  final Function onPress;
  const RoundedButton({
    Key? key,
    required this.label,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: kBleuColor,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
