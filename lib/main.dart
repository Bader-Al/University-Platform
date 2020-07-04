import 'dart:ui';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:psu_platform/appState.dart';
import 'package:psu_platform/appTheme.dart';
import 'package:psu_platform/pages/StudentSidebar/studentSideBar.dart';

import 'package:psu_platform/pages/StudentSidebar/studentCalendar.dart';

import './pages/StudentHome/studentHomeHandler.dart';

void main() {
  //debugRepaintRainbowEnabled = true;

  // runApp(DevicePreview(
  //   builder: (context) => StarterApp(),
  // ));

  runApp(
    ChangeNotifierProvider<AppState>(
      create: (context) => AppState(),
      child: Platform(),
    ),
  );
}

class Platform extends StatefulWidget {
  @override
  _PlatformState createState() => _PlatformState();
}

class _PlatformState extends State<Platform> {
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return ExcludeSemantics(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            showPerformanceOverlay: false,
            // locale: DevicePreview.of(context).locale,
            // builder: DevicePreview.appBuilder,
            title: 'PSU Smart Platform',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,

            home:
                StudentScreen(), // later make routes with initial to login screen and other routes of student, professor, and even navigation screen which is common between users
          ),
        );
      },
    );
  }
}

class StudentScreen extends StatelessWidget {
  // bool isCollapsed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Stack(
          children: <Widget>[
            RepaintBoundary(child: StudentSidebar()),
            MainScreen(),
          ],
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 400);
  AnimationController _controller;

  AppState appState;
  Animation<double> _scaleAnimation;
  var queryData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    Provider.of<AppState>(context, listen: false).toggleSidebar =
        _toggleSideBar;
  }

  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  void _toggleSideBar() {
    setState(() {
      if (Provider.of<AppState>(context, listen: false).sideBarIsCollapsed) {
        Provider.of<AppState>(context, listen: false)
            .setSideBarCollapseMode(true);
        _controller.forward();
      } else {
        Provider.of<AppState>(context, listen: false)
            .setSideBarCollapseMode(false);
        _controller.reverse();
      }

      Provider.of<AppState>(context, listen: false).toggleSideBarCollapseMode();
    });
  }

  @override
  Widget build(BuildContext context) {
    // appState.setSelectedSidebarPage(StudentHome());
    appState = Provider.of<AppState>(context, listen: false);

    Size size = MediaQuery.of(context).size;

    screenHeight = size.height;
    screenWidth = size.width;
    return AnimatedPositioned(
      curve: Curves.easeOutCirc,
      child: GestureDetector(
          onHorizontalDragUpdate: (offset) => {_slideSideBar(offset.delta.dx)},
          child: ScaleTransition(
              scale: _scaleAnimation,
              child: Stack(children: [
                GestureDetector(
                  child: RepaintBoundary(
                    child: AnimatedSwitcher(
                      switchOutCurve: Curves.bounceIn,
                      switchInCurve: Curves.bounceOut,
                      transitionBuilder: (child, animation) {
                        return PositionedTransition(
                            rect: RelativeRectTween(
                                    begin: RelativeRect.fromLTRB(
                                        MediaQuery.of(context).size.width,
                                        0,
                                        0,
                                        0),
                                    end: RelativeRect.fromLTRB(0, 0, 0, 0))
                                .animate(animation),
                            child: ClipRRect(
                              child: child,
                              borderRadius: BorderRadius.circular(
                                  appState.sideBarIsCollapsed ? 0 : 25),
                            ));
                      },
                      duration: Duration(milliseconds: 900),
                      child: appState.selectedSidebarPage,
                    ),
                  ),
                ),
                Visibility(
                  visible: !Provider.of<AppState>(context).sideBarIsCollapsed,
                  child: SizedBox(
                    width: screenWidth,
                    height: screenHeight,
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                )
              ]))),
      top: 0,
      bottom: 0,
      left: Provider.of<AppState>(context, listen: false).sideBarIsCollapsed
          ? 0
          : 0.5 * screenWidth,
      right: Provider.of<AppState>(context, listen: false).sideBarIsCollapsed
          ? 0
          : -0.5 * screenWidth,
      duration: duration,
    );
  }

  void _slideSideBar(dx) {
    // print(dx);
    setState(() {
      if (dx > 7) {
        _controller.forward();
        // isCollapsed = false;
        Provider.of<AppState>(context, listen: false)
            .setSideBarCollapseMode(false);
      } else if (dx < -5) {
        // isCollapsed = true;
        Provider.of<AppState>(context, listen: false)
            .setSideBarCollapseMode(true);
        _controller.reverse();
      }
    });
  }
}

//   Widget sideBar(
//     context,
//   ) {
//     Brightness phonesCurrentBrightnessMode = MediaQuery.of(context)
//         .platformBrightness; // Brightness as in Night/Light Mode

//     return Stack(
//       children: <Widget>[
//         sideBarBackgroundScenary(),
//         AnimatedBuilder(
//           animation: _slideAnimation,
//           builder: (context, child) {
//             return Transform.translate(
//               offset: Offset(30 * _controller.value,
//                   0), // 30*_controller.value :: Treat as if Left Padding
//               child: child,
//             );
//           },
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Spacer(
//                 flex: 6,
//               ),
//               SizedBox(
//                   // height: ((0.2 * screenHeight) / 2),
//                   ),
//               sideBarItems(),
//               Spacer(
//                 flex: 2,
//               ),
//               darkModeWidget(phonesCurrentBrightnessMode),
//               SizedBox(
//                 height: (screenHeight * 0.2) / 2,
//               )
//             ],
//           ),
//         ),
//         sideBarHeader(),
//         Positioned(
//           child: Container(
//             // height: (((0.2 * screenHeight) / 2)),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: <Widget>[
//                 Text(
//                   "Sign Out",
//                   style: TextStyle(
//                       color: Theme.of(context).colorScheme.onPrimary,
//                       fontSize: 11),
//                 ),
//                 SizedBox(
//                   width: 5,
//                 ),
//                 Icon(
//                   Icons.exit_to_app,
//                   color: Theme.of(context).colorScheme.onPrimary,
//                   size: 21,
//                 ),
//               ],
//             ),
//           ),
//           right: 15,
//           top: 15,
//         ),
//       ],
//     );
//   }

//   Widget sideBarBackgroundScenary() {
//     return Container(
//       height: (((0.7 * screenHeight) / 2)),
//       width: screenWidth,
//       decoration: BoxDecoration(
//           color: Theme.of(context).colorScheme.primary,
//           image: DecorationImage(
//               image: CachedNetworkImageProvider(
//                   "https://lenadealmeida.files.wordpress.com/2013/02/dsc_0117.jpg"),
//               fit: BoxFit.cover)),
//     );
//   }

//   Widget sideBarHeader() {
//     return ClipRect(
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
//         child: Container(
//           padding: EdgeInsets.only(left: 15, bottom: 15),
//           height: (((0.2 * screenHeight) / 2) + 42),
//           // screen is reduced to 0.8 from animation.. leaving with 0.2... divide by 2 cz theres upper and lower sides
//           // then add 35 which seems to be the upper app-bar's height

//           width: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(
//               color: Theme.of(context).colorScheme.surface.withAlpha(50)),

//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                 width: 80,
//                 height: 80,
//                 decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     image: DecorationImage(
//                         fit: BoxFit.fitHeight,
//                         image: CachedNetworkImageProvider(
//                             "http://southparkstudios.mtvnimages.com/shared/characters/kids/eric-cartman.png"))),
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     "Bader Al Alami",
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w300,
//                         color: Theme.of(context).colorScheme.onSurface),
//                   ),
//                   Text("217210641",
//                       style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w300,
//                           color: Theme.of(context).colorScheme.onSurface)),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget sideBarItems() {
//     return Container(
//       height: 350,
//       width: 0.45 * screenWidth,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Spacer(flex: 1),
//           Text(
//             "Home",
//             style: TextStyle(color: Colors.white, fontSize: 18),
//           ),
//           SizedBox(height: 50),
//           Text(
//             "Calendar",
//             style: TextStyle(color: Colors.white, fontSize: 18),
//           ),
//           SizedBox(height: 50),
//           Text(
//             "People",
//             style: TextStyle(color: Colors.white, fontSize: 18),
//           ),

//           SizedBox(height: 50),
//           Text(
//             "Tools",
//             style: TextStyle(color: Colors.white, fontSize: 18),
//           ),

//           //Spacer(flex:2)
//         ],
//       ),
//     );
//   }

//   Widget darkModeWidget(phonesCurrentBrightnessMode) {
//     return Container(
//       // width: 0.45 * screenWidth,
//       // width: screenWidth * 0.5 - 100,
//       height: 35,
//       decoration: BoxDecoration(
//           //color: Theme.of(context).colorScheme.background,
//           borderRadius: BorderRadius.circular(25)),
//       child: Padding(
//         padding: EdgeInsets.only(),
//         child: LiteRollingSwitch(
//           // value: true,  TODO use this when implementing AUTO

//           textOn: 'Night',
//           textOff: 'Day',
//           colorOn: Color(0xff333333),
//           colorOff: Colors.white,
//           // iconOn: ImageIcon(AssetImage('icons/moon.png')),
//           // iconOff: Icons.power_settings_new,                        THE ICONS ARE DEALT WITH MANUALLY IN THE CLASS
//           textSize: 17,
//           onChanged: (value) {
//             WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//               setLightModeManually(value);
//               // Add Your Code here.
//             });
//             // SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
//             //   setLightModeManually(value);
//             // }

//             // );
//           },
//         ),
//       ),

//       // Row(
//       //   mainAxisSize: MainAxisSize.max,
//       //   mainAxisAlignment: MainAxisAlignment.spaceBetween,

//       //   children: <Widget>[

//       //     darkButton(),
//       //     autoButton(phonesCurrentBrightnessMode),
//       //     lightButton(),
//       //   ],
//       // ),
//     );
//   }

//   Widget darkButton() {
//     return InkWell(
//         onTap: setLightModeToDark,
//         child: CircleAvatar(
//           radius: 18,
//           backgroundColor:
//               Provider.of<AppState>(context, listen: false).isDarkMode
//                   ? Theme.of(context).colorScheme.surface
//                   : Theme.of(context).colorScheme.onSurface,
//           child: Icon(
//             Icons.lightbulb_outline,
//           ),
//         ));
//   }

//   Widget lightButton() {
//     return InkWell(
//         onTap: setLightModeToLight,
//         child: CircleAvatar(
//           radius: 18,
//           backgroundColor:
//               Provider.of<AppState>(context, listen: false).isDarkMode
//                   ? Theme.of(context).colorScheme.onSurface
//                   : Theme.of(context).colorScheme.surface,
//           child: Icon(Icons.surround_sound),
//         ));
//   }

//   Widget autoButton(Brightness phonesCurrentBrightnessMode) {
//     bool isAuto =
//         Provider.of<AppState>(context, listen: false).isAutoModeForBrightness;
//     bool isDark = Provider.of<AppState>(context, listen: false).isDarkMode;
//     return InkWell(
//         child: Container(
//           //color: Theme.of(context).colorScheme.background,
//           child: Text(
//             "AUTO",
//             style: TextStyle(
//                 color: isAuto
//                     ? Theme.of(context).colorScheme.onSurface
//                     : // max contrast to highlight IT IS AUTO
//                     isDark
//                         ? Colors
//                             .black26 // Low contrast in manual dark mode to signify it's not auto but click me for auto
//                         : Colors.grey.withAlpha(
//                             120) // Low contrast in light mode for the same reason

//                 ),
//           ),
//         ),
//         onTap: () => setLightModeToAuto(phonesCurrentBrightnessMode));
//   }

//   void setLightModeToAuto(Brightness phonesCurrentBrightnessMode) {
//     bool isSystemDark = phonesCurrentBrightnessMode == Brightness.dark;
//     Provider.of<AppState>(context, listen: false).setBrightnessAutoMode(true);
//     Provider.of<AppState>(context, listen: false).setDarkMode(isSystemDark);
//   }

//   void setLightModeToDark() {
//     Provider.of<AppState>(context, listen: false).setDarkMode(true);
//     Provider.of<AppState>(context, listen: false).setBrightnessAutoMode(false);
//   }

//   void setLightModeToLight() {
//     Provider.of<AppState>(context, listen: false).setDarkMode(false);
//     Provider.of<AppState>(context, listen: false).setBrightnessAutoMode(false);
//   }

//   void setLightModeManually(bool value) {
//     Provider.of<AppState>(context, listen: false).setDarkMode(value);
//     Provider.of<AppState>(context, listen: false).setBrightnessAutoMode(false);
//   }
// }

// // class DarkModeSwitch extends StatefulWidget {
// //   @override
// //   _State createState() => _State();
// // }

// // class _State extends State<DarkModeSwitch> {
// //   bool isSwitched = false;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       children: <Widget>[
// //         Text("Use System Setting"),
// //         Switch(
// //               value: isSwitched,
// //               onChanged: (value) {
// //                 setState(() {
// //                   isSwitched = value;
// //                   print(isSwitched);
// //                 });
// //               },
// //               activeTrackColor: Colors.lightGreenAccent,
// //               activeColor: Colors.green,
// //             ),
// //       ],
// //     );

// //   }
