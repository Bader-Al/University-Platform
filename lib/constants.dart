import 'package:flutter/material.dart';

double appBarBorderRadius = 15;
double kBannerHeight = 550;

Color kMainColor = Color(0xff5E7CE2);
Color kSecondColor = Color(0xff63F5EF);
Color kDeepBlueColor = Color(0xff0A369D);
Color kHighlightDark = Color(0xff4472CA);
Color kHighlightLight = Color(0xff5E7CE2);
Color kMainRed = Color(0xffFF206E);
Color kMainDarkness = Color(0xff0C0F0A);

LinearGradient kMainLinear = LinearGradient(
  colors: [kSecondColor, kSecondColor.withAlpha(50)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);


LinearGradient kMainLinearInverse = LinearGradient(colors: [
  kMainColor.withAlpha(150),
  kSecondColor.withAlpha(150),
], begin: Alignment.topLeft, end: Alignment.bottomRight);


LinearGradient kSecondaryLinear = LinearGradient(
    colors: [kSecondColor, kHighlightLight, kHighlightLight],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);


LinearGradient kBannerScheduleLinear = LinearGradient(
  colors: [
    kSecondColor.withAlpha(100),
    kMainColor,
    kSecondColor.withAlpha(100),
  ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

BorderRadius kCustomCardBorderRadius = BorderRadius.only(topLeft: Radius.circular(appBarBorderRadius), topRight:Radius.circular(appBarBorderRadius), bottomLeft: Radius.circular(3),bottomRight: Radius.circular(3));

ShapeBorder kAppBarShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    bottomRight: Radius.circular(appBarBorderRadius),
  ),
);


TextStyle kBannerSmallText =
    TextStyle(color: Color.fromARGB(150, 255, 255, 255), fontSize: 12);
TextStyle kBannerMediumText = TextStyle(color: Colors.white, fontSize: 14);

TextStyle kBannerBigText =
    TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 16);
    
TextStyle kBannerGiantText =
    TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 26);

TextStyle kHorizentalListObjectMedium =
    TextStyle(color: Colors.white, fontSize: 16);

TextStyle kHorizentalListObjectSmall =
    TextStyle(color: Colors.white54, fontSize: 12);

TextStyle kQuickCalendarHeader = 
    TextStyle(color: Colors.white, fontSize: 21 ,fontWeight: FontWeight.w500);

Border kContainerBorderFromRight = Border(
  top: BorderSide(width: 4, color: Colors.red),
  left: BorderSide(width: 4, color: Colors.red),
  bottom: BorderSide(width: 4, color: Colors.red),
  right: BorderSide(width: 4, color: Colors.red),
); //TODO dealwith later
