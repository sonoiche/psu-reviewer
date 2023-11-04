import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final dynamic bgColor;
  final String btnText;

  const CustomButton({super.key, required this.bgColor, required this.btnText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Center(
          child: Text(
            btnText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}