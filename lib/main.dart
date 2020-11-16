import 'dart:ui';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:psu_platform/appState.dart';
import 'package:psu_platform/appTheme.dart';
import 'package:psu_platform/pages/StudentSidebar/studentSideBar.dart';

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
    _controller = AnimationController(
      vsync: this,
      duration: duration,
    );
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
