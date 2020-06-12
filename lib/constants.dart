import 'package:flutter/material.dart';

double appBarBorderRadius = 25;

////// INDICATION COLORS
Color kYellowIndication = Color(0xffFFBC42); //YELLOW RANGE
Color kGreenIndication = Color(0xff0CCE6B); //DODGY GREEN

//////

///THEME COLORS
// Color kMainColor = Color(0xff5E7CE2);
// Color kAccentColor = Color(0xff63F5EF);
// Color kDeepBlueColor = Color(0xff0A369D);


//LIGHTMODE COLORS
Color kSurfaceColor = Colors.white;
Color kCounterSurfaceColor = Colors.black;

////////////////
Color kSurfaceFirstShade = Color(0xffF2F2F2); //change to equation based on surfacecolor

///INDICATOR COLORS  GET RID OF THIS SHIT
Color kHighlightDark = Color(0xff4472CA);
Color kHighlightLight = Color(0xff5E7CE2);
Color kMainRed = Color(0xffFF206E);
Color kMainDarkness = Color(0xff0C0F0A);


/// STYLES DEPENDING ON THEME COLORS ABOVE 
// LinearGradient kMainLinear = LinearGradient(
//   colors: [kAccentColor, kAccentColor.withAlpha(50)],
//   begin: Alignment.centerLeft,
//   end: Alignment.centerRight,
// );


// LinearGradient kMainLinearInverse = LinearGradient(colors: [
//   kMainColor.withAlpha(150),
//   kAccentColor.withAlpha(150),
// ], begin: Alignment.topLeft, end: Alignment.bottomRight);


// LinearGradient kSecondaryLinear = LinearGradient(
//     colors: [kAccentColor, kHighlightLight, kHighlightLight],
//     begin: Alignment.topCenter,
//     end: Alignment.bottomCenter);


// LinearGradient kBannerScheduleLinear = LinearGradient(
//   colors: [
//     kAccentColor.withAlpha(100),
//     kMainColor,
//     kAccentColor.withAlpha(100),
//   ],
//   begin: Alignment.centerLeft,
//   end: Alignment.centerRight,
// );

BorderRadius kCustomCardBorderRadius = BorderRadius.only(topLeft: Radius.circular(appBarBorderRadius), topRight:Radius.circular(appBarBorderRadius), bottomLeft: Radius.circular(3),bottomRight: Radius.circular(3));

ShapeBorder kAppBarShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    bottomRight: Radius.circular(appBarBorderRadius),
  ),
  
);


TextStyle kHorizentalListObjectMedium =
    TextStyle(color: Colors.black, fontSize: 16);

TextStyle kHorizentalListObjectSmall =
    TextStyle(color: Colors.white54, fontSize: 12);

TextStyle kQuickCalendarHeader = 
    TextStyle(color: Colors.black, fontSize: 21 ,fontWeight: FontWeight.w400);

TextStyle kDashboardHeading = TextStyle(color:kCounterSurfaceColor , fontWeight: FontWeight.w300, fontSize: 18);