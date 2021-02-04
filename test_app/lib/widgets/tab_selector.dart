import 'package:flutter/material.dart';
import 'package:test_app/app_bar.dart';
import 'package:test_app/constants.dart';
import 'package:test_app/keys.dart';
import 'package:test_app/models/TabItem.dart';

class TabSelector extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  TabSelector({
    Key key,
    @required this.activeTab,
    @required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        key: AppKeys.tabs,
        currentIndex: AppTab.values.indexOf(activeTab),
        onTap: (index) => onTabSelected(AppTab.values[index]),
        items: Constants.tabs
            .map((TabItem item) => BottomNavigationBarItem(
                icon: Icon(
                  item.icon,
                  key: item.key,
                ),
                label: item.title))
            .toList());
  }
}
