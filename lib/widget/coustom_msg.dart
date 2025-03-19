import 'package:cashapp/utils/colors.dart';
import 'package:cashapp/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomMsgCard extends StatefulWidget {
  final Color bgColor;
  final String title;
  final String img;
  final String description;
  final String subDescription;
  const CustomMsgCard({
    super.key,
    required this.bgColor,
    required this.title,
    required this.img,
    required this.description,
    required this.subDescription,
  });

  @override
  State<CustomMsgCard> createState() => _CustomMsgCardState();
}

class _CustomMsgCardState extends State<CustomMsgCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width * 0.44,

      child: Padding(
        padding: const EdgeInsets.all(AppConstants.kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.mainTxtColor,
                  ).copyWith(fontWeight: FontWeight.w500),
                ),
                Icon(
                  Icons.close,
                  size: 15,
                  color: const Color.fromARGB(255, 212, 210, 210),
                ),
              ],
            ),
            SizedBox(height: 8),
            ClipRRect(
              child: Image.asset(
                widget.img,
                width: 80,
                height: 60,
                //fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(
              widget.description,
              style: TextStyle(
                fontSize: 18,
                color: AppColors.mainTxtColor,
              ).copyWith(fontWeight: FontWeight.w500),
            ),
            Text(
              widget.subDescription,
              style: TextStyle(fontSize: 16, color: AppColors.subTxtColor),
            ),
          ],
        ),
      ),
    );
  }
}
