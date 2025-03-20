import 'package:flutter/material.dart';

class CustomMsgButton extends StatelessWidget {
  final Color bgColor;
  final String title;
  final Color titleColor;
  final VoidCallback? onTap; // Ensure this parameter exists

  const CustomMsgButton({
    super.key,
    required this.bgColor,
    required this.title,
    required this.titleColor,
    this.onTap, // Allow an optional onTap callback
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Use the onTap callback
      child: Container(
        width: 150,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(title, style: TextStyle(color: titleColor, fontSize: 18)),
        ),
      ),
    );
  }
}
