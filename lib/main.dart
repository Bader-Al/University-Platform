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
          accentColor: kAccentColor,
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
          opacity: 1,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          elevation: 8,
          fabLocation: BubbleBottomBarFabLocation.end, //new
          hasNotch: true, //new
          hasInk: true, //new, gives a cute ink effect
          inkColor: Theme.of(context)
              .primaryColor, //optional, uses theme color if not specified
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(
                  Icons.home,
                  color: kCounterSurfaceColor.withAlpha(95),
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: kSurfaceColor,
                ),
                title: Text("Dashboard" , style: TextStyle(color:kSurfaceColor),)),
            BubbleBottomBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.rss_feed,
                color: kCounterSurfaceColor.withAlpha(95),
              ),
              activeIcon: Icon(
                Icons.rss_feed,
                color: kSurfaceColor,
              ),
              title: Text("Feed", style: TextStyle(color:kSurfaceColor),),
            ),
            BubbleBottomBarItem(
                backgroundColor: Colors.indigo,
                icon: Icon(
                  Icons.chat_bubble,
                  color: kCounterSurfaceColor.withAlpha(95),
                ),
                activeIcon: Icon(
                  Icons.chat_bubble,
                  color: kSurfaceColor,
                ),
                title: Text("Chats", style: TextStyle(color:kSurfaceColor),),),
            BubbleBottomBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(
                  Icons.dashboard,
                  color: kCounterSurfaceColor.withAlpha(95),
                ),
                activeIcon: Icon(
                  Icons.library_books,
                  color: kSurfaceColor,
                ),
                title: Text("Academic", style: TextStyle(color:kSurfaceColor),)),
                
          ],
        ),
      );
  }
}


