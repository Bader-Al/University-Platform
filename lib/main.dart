import 'package:flutter/material.dart';

import './pages/StudentHome/studentHomeHandler.dart';

import './constants.dart';

void main() => runApp(Platform());

//put back in homepage class

class Platform extends StatefulWidget {
  @override
  _PlatformState createState() => _PlatformState();
}

class _PlatformState extends State<Platform> {
  Widget build(BuildContext context) {
    return Center(
      child: MaterialApp(
        title: 'PSU Smart Platform',
        theme: ThemeData(
          primaryColor: kMainColor,
          accentColor: kAccentColor,
        ),
        home:
            StudentScreen(), // later make routes with initial to login screen and other routes of student, professor, and even navigation screen which is common between users
      ),
    );
  }
}

class StudentScreen extends StatefulWidget {
  @override
  StudentScreenState createState() => StudentScreenState();
}

class StudentScreenState extends State<StudentScreen>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds:150);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;
  var queryData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0, end: 0.5).animate(_controller);
    
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kMainColor,
        body: Stack(
          children: <Widget>[menu(context), mainScreen(context)],
        ),
      ),
    );
  }

  Widget mainScreen(context) {
    return AnimatedPositioned(
      curve: Curves.easeOut,
      child: GestureDetector(
          onPanUpdate: (offset) => {_slideSideBar(offset.delta.dx)},
          child: ScaleTransition(
              scale: _scaleAnimation,
              child: Stack(children: [
                ClipRRect(child: StudentHome(), borderRadius: isCollapsed?BorderRadius.circular(0):BorderRadius.circular(25),),
                Positioned(
                  child: GestureDetector(
                      onTap: _toggleSideBar,
                      child: Icon(Icons.menu, color: Colors.white)),
                  top: 15,
                  left: 15,
                ),
              ]))),
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.5 * screenWidth,
      right: isCollapsed ? 0 : -0.5 * screenWidth,
      duration: duration,
    );
  }

  void _toggleSideBar() {
    setState(() {
      if (isCollapsed) {
        _controller.forward();
      } else {
        _controller.reverse();
      }

      isCollapsed = !isCollapsed;
    });
  }

  void _slideSideBar(dx) {
    setState(() {
      if (dx > 0) {
        _controller.forward();
       isCollapsed = false;
      } else if (dx < 0) {
        isCollapsed = true;
        _controller.reverse();
      }
    });
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Home",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              SizedBox(height: 10),
              Text(
                "Calendar",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              SizedBox(height: 10),
              Text(
                "People",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              SizedBox(height: 10),
              Text(
                "Tools",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
