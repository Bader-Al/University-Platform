import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import './pages/homePage.dart';
import './pages/feedPage.dart';
import './pages/chats.dart';

import './constants.dart';

void main() => runApp(
  
  Platform());

//put back in homepage class

class Platform extends StatefulWidget {
  @override
  _PlatformState createState() => _PlatformState();
}

class _PlatformState extends State<Platform> {
  

  int _pageIndex = 0;

  Widget build(BuildContext context) {
    return Center(
      child: MaterialApp(
        
        title: 'PSU Smart Platform',
        theme: ThemeData(
          primaryColor: kMainColor,
          accentColor: kSecondColor,
        ),
        home: StudentScreen(), // later make routes with initial to login screen and other routes of student, professor, and even navigation screen which is common between users
      ),
    );
  }
}

class StudentScreen extends StatefulWidget {
  @override
  StudentScreenState createState() => StudentScreenState();
}

class StudentScreenState extends State<StudentScreen> {
  List<Widget> navBarRoutes = [
    HomePage(),
    FeedPage(),
    Chats(),
  ];
  int _pageIndex =0;
  bool fabEnabled= true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: navBarRoutes[_pageIndex],
        floatingActionButton: FloatingActionButton( // To get rid of fab where neccassary.. Use ?Iterator: checking for navBarRoute [index]
          onPressed: !fabEnabled? null :() {/* Should depend on navBarRoute[index] */},
          child: Icon(_pageIndex==0?Icons.navigation:_pageIndex==1?Icons.add: Icons.help), // Dynamically change. HomeScreen : Red Navigation.  FeedScreen : POST where Authorized (Accent Color), not authorized (GRAY)
          backgroundColor: fabEnabled?kMainRed:Colors.grey,
          elevation: fabEnabled?6:0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BubbleBottomBar(
          onTap: (index){
            setState(() {
             _pageIndex = index;
             if(_pageIndex==1){fabEnabled=false;}
             else fabEnabled=true;
            });
          },
          currentIndex: _pageIndex,
          opacity: .2,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          elevation: 8,
          fabLocation: BubbleBottomBarFabLocation.end, //new
          hasNotch: true, //new
          hasInk: true, //new, gives a cute ink effect
          inkColor: Theme.of(context)
              .accentColor, //optional, uses theme color if not specified
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text("Home")),
            BubbleBottomBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.rss_feed,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.rss_feed,
                color: Theme.of(context).primaryColor,
              ),
              title: Text("Feed"),
            ),
            BubbleBottomBarItem(
                backgroundColor: Colors.indigo,
                icon: Icon(
                  Icons.chat_bubble,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.chat_bubble,
                  color: Colors.indigo,
                ),
                title: Text("Chats"),),
            BubbleBottomBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(
                  Icons.dashboard,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.dashboard,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text("Dashboard")),
                BubbleBottomBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.menu,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text("Menu")),
          ],
        ),
      );
  }
}


