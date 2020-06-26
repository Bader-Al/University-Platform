import 'package:flutter/material.dart';

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:psu_platform/pages/StudentHome/academicsPage.dart';
import 'dashboardPage.dart';
import 'feedPage.dart';
import 'chatsPage.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

import '../../constants.dart';

class StudentHome extends StatefulWidget {
  @override
  StudentHomeState createState() => StudentHomeState();
}

class StudentHomeState extends State<StudentHome> {
  List<Widget> navBarRoutes = [
    DashboardPage(),
    AcademicsPage(),
    ChatsPage(),
    FeedPage(),
  ];
  int _pageIndex = 0;
  bool fabEnabled = true;
  PageController _pageController ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = new PageController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
   // FlutterStatusbarcolor.setNavigationBarColor(Theme.of(context).colorScheme.primary) ;
    //navBarRoutes[_pageIndex]
    return Scaffold(
        body: PageView(
          controller: _pageController, 
          physics: ScrollPhysics(parent: BouncingScrollPhysics()),
          children: <Widget>[...navBarRoutes],
          onPageChanged: (index){setState(() {
            _pageIndex=index;
          });},
        ),
        floatingActionButton: FloatingActionButton(
          // To get rid of fab where neccassary.. Use ?Iterator: checking for navBarRoute [index]
          onPressed: !fabEnabled
              ? null
              : () {/* Should depend on navBarRoute[index] */},
          child: Icon(Icons.arrow_drop_up, color: Theme.of(context).colorScheme.onPrimary,),
            // _pageIndex == 0
            //   ? Icons.navigation
            //   : _pageIndex == 1
            //       ? Icons.add
            //       : Icons
            //           .help), // Dynamically change. HomeScreen : Red Navigation.  FeedScreen : POST where Authorized (Accent Color), not authorized (GRAY)
          backgroundColor:
              fabEnabled ? Theme.of(context).colorScheme.primary : Colors.grey,
          elevation: fabEnabled ? 6 : 0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: homeBottomNavigationBar());
  }

  Widget homeBottomNavigationBar() {
    return BubbleBottomBar(
      onTap: (index) {
        _pageController.jumpToPage(index);
        setState(() {
          _pageIndex = index;
          if (_pageIndex == 1) {
            fabEnabled = false;
          } else
            fabEnabled = true;
        });
      },
      backgroundColor: Theme.of(context).colorScheme.surface,
      currentIndex: _pageIndex,
      opacity: 1,
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      elevation: 1,
      fabLocation: BubbleBottomBarFabLocation.end, //new
      hasNotch: true, //new
      hasInk: true, //new, gives a cute ink effect
      inkColor: Theme.of(context)
          .colorScheme.primary, //optional, uses theme color if not specified
      items: <BubbleBottomBarItem>[
        BubbleBottomBarItem(
          
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.onSurface.withAlpha(95),
              size: 24,
            ),
            activeIcon: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.onPrimary,
              size: 30,
            ),
            title: Text(
              "Home",
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,)
            )),
        BubbleBottomBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(
              Icons.book,
              color: Theme.of(context).colorScheme.onSurface.withAlpha(95),
              size: 24,
            ),
            activeIcon: Icon(
              Icons.library_books,
              color: Theme.of(context).colorScheme.onPrimary,
              size: 30,
            ),
            title: Text(
              "Courses",
             style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,)
            )),
        BubbleBottomBarItem(
          backgroundColor: Theme.of(context).colorScheme.primary,
          icon: Icon(
            Icons.chat_bubble,
            color: Theme.of(context).colorScheme.onSurface.withAlpha(95),
              size: 24,
          ),
          activeIcon: Icon(
            Icons.chat_bubble,
            color: Theme.of(context).colorScheme.onPrimary,
              size: 30,
          ),
          title: Text(
            "Chats",
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,),
          ),
        ),
        BubbleBottomBarItem(
          backgroundColor: Theme.of(context).colorScheme.primary,
          icon: Icon(
            Icons.web,
            color: Theme.of(context).colorScheme.onSurface.withAlpha(95),
              size: 24,
          ),
          activeIcon: Icon(
            Icons.web,
            color: Theme.of(context).colorScheme.onPrimary,
              size: 30,
          ),
          title: Text(
            "Social",
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
      ],
    );
  }
}
