import 'package:flutter/material.dart';
import 'package:minglewise_clone_app/widgets/top_navigation_item.dart';
import 'chat_screen.dart';
import 'chats_screen.dart';
import 'home_page.dart';
import 'match_screen.dart';

class TopNavigationScreen extends StatelessWidget {
  static const String id = 'top_navigation_screen';
  final List<TopNavigationItem> navigationItems = [
    TopNavigationItem(
      screen: ChatScreen(),
      iconData: Icons.message_rounded,
    ),
    TopNavigationItem(
      screen: MatchScreen(),
      iconData: Icons.favorite,
    ),
    TopNavigationItem(screen: HomePage(), iconData: Icons.close)
  ];

  @override
  Widget build(BuildContext context) {
    var tabBar = TabBar(
      tabs: navigationItems
          .map((navItem) => Container(
          height: double.infinity,
          child: Tab(icon: Icon(navItem.iconData, size: 26))))
          .toList(),
    );

    var appBar = AppBar(flexibleSpace: tabBar);

    return DefaultTabController(
      length: navigationItems.length,
      child: SafeArea(
        child: Scaffold(
          appBar: appBar,
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height -
                  tabBar.preferredSize.height -
                  appBar.preferredSize.height,
              width: MediaQuery.of(context).size.width,
              child: Container(
                child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: navigationItems
                        .map((navItem) => navItem.screen)
                        .toList()),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
