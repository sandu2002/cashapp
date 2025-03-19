import 'package:flutter/material.dart';

class AppColors {
  //primary colors
  
  static const Color bgColor = Color(0xffffffff);
  static Color subBgColor = Color(0xffffffff).withOpacity(0.5);
  static const Color mainTxtColor = Color(0xff343434);
  static const Color subTxtColor =  Color(0xff686868);
  static const Color gButton =  Color(0xff01D651);
  static const Color pWhiteColor =  Color(0xff8420F4);
  static const Color bWhiteColor =  Color(0xff2D65DB);
  static const Color glowButton =  Color.fromARGB(255, 9, 233, 95);
  static const Color newColor = Color(0xffFF5733);

  //gradient colors
  
  static const int gradientStart = 0XFF01F0FF;
  static const int gradientEnd = 0XFF4441ED;
  LinearGradient kPrimaryGradient = const LinearGradient(
    colors: <Color>[
      Color(gradientStart),
      Color(gradientEnd),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}