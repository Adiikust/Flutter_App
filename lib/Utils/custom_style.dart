import 'package:flutter/material.dart';
import 'custom_color.dart';
import 'dimensions.dart';

class CustomStyle {
//------------------------dark--------------------------------

  // static var darkHeading5TextStyle = GoogleFonts.inter(
  //   color: CustomColor.primaryDarkTextColor,
  //   fontSize: Dimensions.headingTextSize5,
  //   fontWeight: FontWeight.w400,
  // );

//------------------------light--------------------------------
//   static var lightHeading1TextStyle = GoogleFonts.inter(
//     color: CustomColor.primaryLightTextColor,
//     fontSize: Dimensions.headingTextSize1,
//     fontWeight: FontWeight.w700,
//   );

  static var screenGradientBG2 = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        CustomColor.primaryDarkColor,
        CustomColor.primaryBGDarkColor,
      ],
    ),
  );
}
