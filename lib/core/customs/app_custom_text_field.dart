import 'package:flutter/material.dart';

class AppCustomTextField extends StatelessWidget {
  const AppCustomTextField({
    super.key,
    required this.labelText,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.fillColor = Colors.white,
    this.borderRadius = 12.0,
    this.borderColor = Colors.grey,
    this.focusedBorderColor,
    this.errorBorderColor = Colors.red,
    required this.icon,
    this.validator,
  });

  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Color fillColor;
  final double borderRadius;
  final Color borderColor;
  final Color? focusedBorderColor;
  final Color errorBorderColor;
  final Icon icon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          labelText: labelText,
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: focusedBorderColor ?? borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: errorBorderColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: errorBorderColor),
          ),
          prefixIcon: icon,
        ),
      ),
    );
  }
}
