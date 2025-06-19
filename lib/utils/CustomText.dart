import 'package:flutter/material.dart';
class CustomTextFormField extends StatelessWidget {
  final Color? fillColor, borderColor;
  final TextStyle? hintStyle, labelStyle, textStyle;
  final String? hintText;
  final String? Function(String?)? validator;
  final Widget? label, prefixIcon, suffixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool isSecure, isPassword, readOnly;
  const CustomTextFormField({
    Key? key,
    this.fillColor,
    this.borderColor,
    this.hintStyle,
    this.hintText,
    this.validator,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.labelStyle,
    this.textStyle,
    this.keyboardType,
    this.isSecure = false,
    this.isPassword = false,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 20),
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: isPassword ? isSecure : false,
        readOnly: readOnly,
        style: textStyle,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          label: label,
          labelStyle: labelStyle,
          hintText: hintText,
          hintStyle: hintStyle,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: fillColor != null,
          fillColor: fillColor,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? Colors.grey,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? Theme.of(context).primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
