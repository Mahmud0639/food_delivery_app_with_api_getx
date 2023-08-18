import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/account/account_page.dart';
import 'package:food_delivery_app/cart_history.dart';
import 'package:food_delivery_app/main_food_page.dart';
import 'package:food_delivery_app/utils/app_used_colors.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedPage = 0;
 // late PersistentTabController _controller;



  List pages = [
    MainFoodPage(),
    Center(child: Container(child: Text("Next page"),)),
   CartHistory(),
    AccountPage()
  ];

  void onTapNavigation(int position){
      setState(() {
        selectedPage = position;
      });
  }

 /* @override
  void initState(){
    super.initState();
   // _controller = PersistentTabController(initialIndex: 0);
  }*/

/*  List<Widget> _buildScreens() {
    return [
      MainFoodPage(),
      Center(child: Container(child: Text("Next page"),)),
      Center(child: Container(child: Text("Next next page"),)),
      Center(child: Container(child: Text("Next next next page"),))
    ];
  }*/

/*  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.archivebox),
        title: ("History"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.cart_fill),
        title: ("Cart"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person),
        title: ("Me"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }*/
/*
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: pages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(

        selectedItemColor: AppUsedColors.mainColor,
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedPage,
        selectedFontSize: 0.0,//to solve layout issue
        unselectedFontSize: 0.0,//to solve layout issue
        onTap: onTapNavigation,

        items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "Home"
         ),BottomNavigationBarItem(
          icon: Icon(Icons.archive_outlined),
          label: "History"
         ),BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: "Cart"
         ),BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Me"
         ),
      ],

      )

    );
  }
}
