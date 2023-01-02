import 'package:bells_mirror/ui/views/authentication/register/register_screen.dart';
import 'package:bells_mirror/ui/views/dashboard/home_widget/home_widget.dart';
import 'package:bells_mirror/ui/views/dashboard/search_widget/search_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bells_mirror/utils/constant_string.dart';
import 'package:bells_mirror/utils/locator.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'dashboard/bookmark_news_widget/bookmark_news_widget.dart';
import 'dashboard/dashboard_screen.dart';
import 'dashboard/menu_widget/menu_widget.dart';
import 'dashboard/notification_widget/notification_widget.dart';
import 'home_screen_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {
    controller =  TabController(initialIndex: 0, length: 5, vsync: this);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // setupScreenUtil(context);

    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (model) {
        return Scaffold(
          backgroundColor: Colors.white,

          appBar: AppBar(
            centerTitle: true,
            leading:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 20,
                  child: Container(
                    height: 20,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Constant.logoImage),
                            fit: BoxFit.contain)),
                  )),
            ),

            actions: <Widget>[
              //
              // Icon(
              //   Icons.cancel
              // ),


              IconButton(icon: Icon(Icons.notifications
              ), onPressed: (){

                Get.to(NotificationScreen(), fullscreenDialog: true, transition: Transition.rightToLeft);

              }),

            ],
          ),

          body: Container(
            color: Colors.white,
            child: PersistentTabView(
              context,
              controller: model.controller,
              screens: <Widget>[


                HomeWidget(),

                SearchWidget(),

                BookmarkNewsWidget(),

                MenuWidget(),
              ],
              items: <PersistentBottomNavBarItem>[
                PersistentBottomNavBarItem(
                  icon: Icon(CupertinoIcons.home),
                  title: ("Home"),
                  activeColorPrimary: CupertinoColors.activeBlue,
                  inactiveColorPrimary: CupertinoColors.systemGrey,
                ),
                PersistentBottomNavBarItem(
                  icon: Icon(CupertinoIcons.search),
                  title: ("Search"),
                  activeColorPrimary: CupertinoColors.activeBlue,
                  inactiveColorPrimary: CupertinoColors.systemGrey,
                ),
                PersistentBottomNavBarItem(
                  icon: Icon(CupertinoIcons.bookmark),
                  title: ("Bookmark"),
                  activeColorPrimary: CupertinoColors.activeBlue,
                  inactiveColorPrimary: CupertinoColors.systemGrey,
                ),
                PersistentBottomNavBarItem(
                  icon: Icon(Icons.menu),
                  title: ("Menu"),
                  activeColorPrimary: CupertinoColors.activeBlue,
                  inactiveColorPrimary: CupertinoColors.systemGrey,
                ),
              ],
              confineInSafeArea: true,
              backgroundColor: Colors.white, // Default is Colors.white.
              handleAndroidBackButtonPress: true, // Default is true.
              resizeToAvoidBottomInset:
                  true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
              stateManagement: true, // Default is true.
              hideNavigationBarWhenKeyboardShows:
                  true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
              decoration: NavBarDecoration(
                borderRadius: BorderRadius.circular(10.0),
                colorBehindNavBar: Colors.white,
              ),
              popAllScreensOnTapOfSelectedTab: true,
              popActionScreens: PopActionScreensType.all,
              itemAnimationProperties: ItemAnimationProperties(
                // Navigation Bar's items animation properties.
                duration: Duration(milliseconds: 200),
                curve: Curves.ease,
              ),
              screenTransitionAnimation: ScreenTransitionAnimation(
                // Screen transition animation on change of selected tab.
                animateTabTransition: true,
                curve: Curves.ease,
                duration: Duration(milliseconds: 200),
              ),
              navBarStyle: NavBarStyle
                  .style3, // Choose the nav bar style with this property.
            ),
          ),
        );
      },
    );
  }

  Widget getDashboardWidget(HomeScreenController model) {
    switch (model.selectedItem) {
      case HomeMenu.dashboard:
        return DashboardScreen();
    }

    return Container(); // UnverifiedScreen();
  }

  Widget _menu({BuildContext context, HomeScreenController model}) {
    String name = model.studentData.name;
    String matric = model.studentData.matric;
    String email = model.studentData.email;

    return Padding(
      padding: EdgeInsets.only(left: 0, top: 0),
      child: Align(
          alignment: Alignment.topLeft,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                        Color(0xff5584DF),
                        Color(0xff00F98D),
                      ])),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(Constant.onBoardingOne),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                Text(
                                  matric,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Visibility(
                    visible: !model.isAssistant,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              model.closeDrawer(HomeMenu.dashboard);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, right: 0),
                              child: dashBoardMenuItem(
                                  FontAwesome.home, "Dashboard"),
                            )),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {
                      model.closeDrawer(HomeMenu.appointment);
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, bottom: 10, right: 0),
                      child: dashBoardMenuItem(Icons.note_add, "Appointment"),
                    )),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {
                      model.closeDrawer(HomeMenu.pill_reminder);
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, bottom: 10, right: 0),
                      child: dashBoardMenuItem(Icons.note_add, "Pill Reminder"),
                    )),
                Visibility(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                        onTap: () {
                          model.closeDrawer(HomeMenu.appointment_history);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, right: 0),
                          child: dashBoardMenuItem(
                              FontAwesome.home, "Appointment History"),
                        )),
                  ],
                )),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {
                      model.closeDrawer(HomeMenu.signOut);
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, bottom: 10, right: 0),
                      child:
                          dashBoardMenuItem(Icons.fastfood_outlined, "Log Out"),
                    )),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 24,
                ),
                Center(
                  child: Text(
                    "Created by Malik",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget dashBoardMenuItem(IconData icon, String name) {
    return Container(
      color: Color(0xffF3F3F3),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, bottom: 10, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.blue,
            ),
            SizedBox(
              width: 19,
            ),
            Text(
              name,
              style: GoogleFonts.roboto(
                  color: Colors.blue,
                  fontSize: 16,
                  fontStyle: FontStyle.normal),
            )
          ],
        ),
      ),
    );
  }
}
