import 'package:facebook/screens/home_screen.dart';
import 'package:facebook/widgets/custom_tabar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    FontAwesomeIcons.user,
    FontAwesomeIcons.users,
    Icons.notification_add,
    Icons.menu,

  ];
   int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
     body:IndexedStack(
       index: _selectedIndex,
       children: _screens,
     ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: CustomTabBar(
            icons:_icons,
            selectedIndex:_selectedIndex,
            onTap:(index)=>setState((){
             _selectedIndex = index;
            })
          ),
        ),
      ),
    );
  }
}

