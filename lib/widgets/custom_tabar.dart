import 'package:facebook/utitlities.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData>? icons;
  final int? selectedIndex;
  final Function(int)? onTap;
  final bool isButtonIndicator;

  CustomTabBar(
      {this.onTap,
      this.icons,
      this.selectedIndex,
      this.isButtonIndicator = false});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        border: isButtonIndicator
            ? Border(
                bottom: BorderSide(
                  color: Utilities.facebookBlue,
                  width: 3,
                ),
              )
            : Border(
                top: BorderSide(
                  color: Utilities.facebookBlue,
                  width: 3,
                ),
              ),
      ),
      tabs: icons!
          .asMap()
          .map(
            (i, e) => MapEntry(
              i,
              Tab(
                icon: Icon(
                  e,
                  color: i == selectedIndex
                      ? Utilities.facebookBlue
                      : Colors.black45,
                  size: 30,
                ),
              ),
            ),
          )
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
