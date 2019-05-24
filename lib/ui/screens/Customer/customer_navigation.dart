import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'customer_history.dart';
import 'customer_profile.dart';
import 'customer_projects.dart';

enum TabItem {
  history,
  projects,
  profile
}

String tabItemName(TabItem tabItem) {
  switch (tabItem) {
    case TabItem.history:
      return "History";
    case TabItem.projects:
      return "Projects";
    case TabItem.profile:
      return "Profile";
  }
  return null;
}

class CustomerNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CustomerNavigationState();
}

class CustomerNavigationState extends State<CustomerNavigation> {
  TabItem currentItem = TabItem.projects;

  _onSelectTab(int index) {
    switch (index) {
      case 0:
        _updateCurrentItem(TabItem.history);
        break;
      case 1:
        _updateCurrentItem(TabItem.projects);
        break;
      case 2:
        _updateCurrentItem(TabItem.profile);
        break;
    }
  }

  _updateCurrentItem(TabItem item) {
    setState(() {
      currentItem = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),


    );

  }

  Widget _buildBody() {
    switch (currentItem) {
      case TabItem.history:
        return CustomerHistory();
      case TabItem.projects:
        return CustomerProjects();
      case TabItem.profile:
        return CustomerProfile();
    }
    return Container();
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(icon: Icons.history, tabItem: TabItem.history),
        _buildItem(icon: Icons.list, tabItem: TabItem.projects),
        _buildItem(icon: Icons.account_circle, tabItem: TabItem.profile),
      ],
      onTap: _onSelectTab,
    );
  }

  BottomNavigationBarItem _buildItem({IconData icon, TabItem tabItem}) {
    String text = tabItemName(tabItem);
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(item: tabItem),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _colorTabMatching(item: tabItem),
        ),
      ),
    );
  }

  Color _colorTabMatching({TabItem item}) {
    return currentItem == item ? Colors.lightBlue : Colors.grey;
  }
}
