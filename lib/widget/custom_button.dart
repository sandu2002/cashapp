import 'package:cashapp/utils/text_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Color bgColor;
  final String title;
  final Color titleColor;
  const CustomButton({
    super.key,
    required this.bgColor,
    required this.title,
    required this.titleColor,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          // Handle button press
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(widget.bgColor),
        ),
        child: Text(
          widget.title,
          style: AppTextStyles.appTitle.copyWith(
            fontSize: 18,
            color: widget.titleColor,
          ),
        ),
      ),
    );
  }
}
