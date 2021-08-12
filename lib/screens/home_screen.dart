import 'package:facebook/data.dart';
import 'package:facebook/widgets/CreatePost.dart';
import 'package:facebook/widgets/circle_button.dart';
import 'package:facebook/widgets/rooms.dart';
import 'package:facebook/widgets/stories.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text(
              'facebook',
              style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              CircleButton(
                icon: Icons.search,
              ),
              CircleButton(
                icon: FontAwesomeIcons.facebookMessenger,
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              color: Colors.red,
              child: CreatePost(currentUser: currentUser),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: Rooms(onlineUsers: onlineUsers),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            sliver: SliverToBoxAdapter(
              child: Stories(
                currentUser: currentUser,
                stories: stories,
              ),
            ),
          )
        ],
      ),
    );
  }
}
