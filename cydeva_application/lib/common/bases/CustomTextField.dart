import 'package:cydeva_application/common/Colors/AppColors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.textInputType,
    required this.obscureText,
    required this.suffixIcon,
    required this.hintText,
    this.validator,
    this.onSaved,
    this.onChanged,
    required this.prefixIcon,
    required this.readOnly,
    required this.width,
    required this.height,
    required this.colorHintText,
  });

  final TextEditingController controller;
  final TextInputType textInputType;
  final bool obscureText;
  final IconButton suffixIcon;
  final String hintText;
  final String? Function(String?)? validator; // Specify the type here
  final Function(String?)? onSaved;
  final Function(String)? onChanged;
  final Icon prefixIcon;
  final bool readOnly;
  final double width;
  final double height;
  final Color colorHintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        readOnly: readOnly,
        controller: controller,
        keyboardType: textInputType,
        style: const TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.normal,
            fontSize: 15),
        obscureText: obscureText,
        decoration: InputDecoration(
            hintStyle: TextStyle(color: colorHintText, fontSize: 16),
            border: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.borderColor),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            contentPadding: const EdgeInsets.all(20),
            suffixIcon: suffixIcon,
            labelText: hintText, // change here hinttext
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(width: 1, color: AppColors.borderColor)),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(width: 1, color: AppColors.borderColor),
            )),
        validator: validator,
        onSaved: onSaved,
        onChanged: onChanged,
      ),
    );
  }
}