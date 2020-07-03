import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:provider/provider.dart';
import 'appState.dart';

class StudentSidebar extends StatelessWidget {
  // const StudentSidebar();

  double screenWidth, screenHeight;

  final Duration duration = const Duration(milliseconds: 550);

  AppState appState;

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    appState = Provider.of<AppState>(context, listen: false);

    screenHeight = size.height;
    screenWidth = size.width;

    Brightness phonesCurrentBrightnessMode = MediaQuery.of(context)
        .platformBrightness; // Brightness as in Night/Light Mode
    return Stack(
      children: <Widget>[
        sideBarBackgroundScenary(context),
        AnimatedPadding(
          padding: appState.sideBarIsCollapsed
              ? EdgeInsets.zero
              : EdgeInsets.only(left: 30),
          duration: duration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Spacer(
                flex: 6,
              ),
              SizedBox(
                  // height: ((0.2 * screenHeight) / 2),
                  ),
              sideBarItems(),
              Spacer(
                flex: 2,
              ),
              darkModeWidget(phonesCurrentBrightnessMode),
              SizedBox(
                height: (screenHeight * 0.2) / 2,
              )
            ],
          ),
        ),
        sideBarHeader(context),
        Positioned(
          child: Container(
            // height: (((0.2 * screenHeight) / 2)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Sign Out",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 11),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.exit_to_app,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 21,
                ),
              ],
            ),
          ),
          right: 15,
          top: 15,
        ),
      ],
    );
  }

  Widget sideBarBackgroundScenary(context) {
    return Container(
      height: (((0.7 * screenHeight) / 2)),
      width: screenWidth,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          image: DecorationImage(
              image: CachedNetworkImageProvider(
                  "https://lenadealmeida.files.wordpress.com/2013/02/dsc_0117.jpg"),
              fit: BoxFit.cover)),
    );
  }

  Widget sideBarHeader(context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
        child: Container(
          padding: EdgeInsets.only(left: 15, bottom: 15),
          height: (((0.2 * screenHeight) / 2) + 42),
          // screen is reduced to 0.8 from animation.. leaving with 0.2... divide by 2 cz theres upper and lower sides
          // then add 35 which seems to be the upper app-bar's height

          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface.withAlpha(50)),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: CachedNetworkImageProvider(
                            "http://southparkstudios.mtvnimages.com/shared/characters/kids/eric-cartman.png"))),
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Bader Al Alami",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  Text("217210641",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context).colorScheme.onSurface)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget sideBarItems() {
    return Container(
      height: 350,
      width: 0.45 * screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Spacer(flex: 1),
          Text(
            "Home",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 50),
          Text(
            "Calendar",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 50),
          Text(
            "People",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),

          SizedBox(height: 50),
          Text(
            "Tools",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),

          //Spacer(flex:2)
        ],
      ),
    );
  }

  Widget darkModeWidget(phonesCurrentBrightnessMode) {
    return Container(
      // width: 0.45 * screenWidth,
      // width: screenWidth * 0.5 - 100,
      height: 35,
      decoration: BoxDecoration(
          //color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: EdgeInsets.only(),
        child: LiteRollingSwitch(
          // value: true,  TODO use this when implementing AUTO

          textOn: 'Night',
          textOff: 'Day',
          colorOn: Color(0xff333333),
          colorOff: Colors.white,
          // iconOn: ImageIcon(AssetImage('icons/moon.png')),
          // iconOff: Icons.power_settings_new,                        THE ICONS ARE DEALT WITH MANUALLY IN THE CLASS
          textSize: 17,
          onChanged: (value) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              setLightModeManually(value);
              // Add Your Code here.
            });
            // SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
            //   setLightModeManually(value);
            // }

            // );
          },
        ),
      ),

      // Row(
      //   mainAxisSize: MainAxisSize.max,
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,

      //   children: <Widget>[

      //     darkButton(),
      //     autoButton(phonesCurrentBrightnessMode),
      //     lightButton(),
      //   ],
      // ),
    );
  }

  Widget autoButton(Brightness phonesCurrentBrightnessMode, context) {
    bool isAuto = appState.isAutoModeForBrightness;
    bool isDark = appState.isDarkMode;
    return InkWell(
        child: Container(
          //color: Theme.of(context).colorScheme.background,
          child: Text(
            "AUTO",
            style: TextStyle(
                color: isAuto
                    ? Theme.of(context).colorScheme.onSurface
                    : // max contrast to highlight IT IS AUTO
                    isDark
                        ? Colors
                            .black26 // Low contrast in manual dark mode to signify it's not auto but click me for auto
                        : Colors.grey.withAlpha(
                            120) // Low contrast in light mode for the same reason

                ),
          ),
        ),
        onTap: () => setLightModeToAuto(phonesCurrentBrightnessMode, context));
  }

  void setLightModeManually(bool value) {
    appState.setDarkMode(value);
    appState.setBrightnessAutoMode(false);
  }

  void setLightModeToAuto(Brightness phonesCurrentBrightnessMode, context) {
    bool isSystemDark = phonesCurrentBrightnessMode == Brightness.dark;
    appState.setBrightnessAutoMode(true);
    appState.setDarkMode(isSystemDark);
  }
}
