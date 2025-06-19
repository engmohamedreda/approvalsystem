import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final TextStyle? style;
  final Color? fillColor;
  final Color? borderColor;
  final double? width; // New width parameter
  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.style,
    this.fillColor,
    this.borderColor,
    this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final defaultStyle = const TextStyle(
      color: Colors.white,
      fontSize: 16,
    );
    return SizedBox(
      width: width, // Apply custom width here
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: fillColor ?? Theme.of(context).primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
            ),
          ),
        ),
        child: Text(
          text,
          style: defaultStyle.merge(style),
        ),
      ),
    );
  }
}
