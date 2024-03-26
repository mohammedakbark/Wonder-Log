import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:wanderlog/util/colors.dart';
import 'package:wanderlog/view/home.dart';
import 'package:wanderlog/view/location.dart';
import 'package:wanderlog/view/notification.dart';
import 'package:wanderlog/view/profile.dart';

class Navigation extends StatelessWidget {
  Navigation({super.key});
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreens() {
    return [ HomeTab(), const NotificationTab(), const LocationTab(), const ProfileTab()];
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return PersistentTabView(
      
      
      navBarHeight: height * .09,
      context,
      controller: _controller,
            screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: DARK_BLUE_COLOR,

      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(20.0),
        colorBehindNavBar: Colors.white,
      ),

      itemAnimationProperties: const ItemAnimationProperties(
        duration:  Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.simple, // Choose the nav bar style with this property.
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: const ImageIcon(AssetImage("assets/home.png")),
          title: ("Home"),
          activeColorPrimary: WHITE,
          inactiveColorPrimary: CupertinoColors.systemGrey3),
      PersistentBottomNavBarItem(
        icon: const ImageIcon(AssetImage("assets/notification.png")),
        title: ("Notification"),
        activeColorPrimary: WHITE,
        inactiveColorPrimary: CupertinoColors.systemGrey3,
      ),
      PersistentBottomNavBarItem(
        icon: const ImageIcon(AssetImage("assets/location.png")),
        title: ("Location"),
        activeColorPrimary: WHITE,
        inactiveColorPrimary: CupertinoColors.systemGrey3,
      ),
      PersistentBottomNavBarItem(
        icon: const ImageIcon(AssetImage("assets/profile.png")),
        title: ("Profile"),
        activeColorPrimary: WHITE,
        inactiveColorPrimary: CupertinoColors.systemGrey3,
      ),
    ];
  }
}
