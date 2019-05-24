import 'package:flutter/material.dart';

import 'craftsman_history.dart';
import 'craftsman_profile.dart';
import 'craftsman_tasks.dart';

enum TabItem {
  history,
  tasks,
  profile
}

String tabItemName(TabItem tabItem) {
  switch (tabItem) {
    case TabItem.history:
      return "History";
    case TabItem.tasks:
      return "Tasks";
    case TabItem.profile:
      return "Profile";
  }
  return null;
}

class CraftsmanNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CraftsmanNavigationState();
}

class CraftsmanNavigationState extends State<CraftsmanNavigation> {
  TabItem currentItem = TabItem.tasks;

  _onSelectTab(int index) {
    switch (index) {
      case 0:
        _updateCurrentItem(TabItem.history);
        break;
      case 1:
        _updateCurrentItem(TabItem.tasks);
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
        return CraftsmanHistory();
      case TabItem.tasks:
        return CraftsmanTasks();
      case TabItem.profile:
        return CraftsmanProfile();
    }
    return Container();
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(icon: Icons.history, tabItem: TabItem.history),
        _buildItem(icon: Icons.list, tabItem: TabItem.tasks),
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
    return currentItem == item ? Colors.blue : Colors.grey;
  }
}
