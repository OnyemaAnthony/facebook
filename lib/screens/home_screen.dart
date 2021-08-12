import 'package:facebook/data.dart';
import 'package:facebook/models/post_model.dart';
import 'package:facebook/widgets/CreatePost.dart';
import 'package:facebook/widgets/circle_button.dart';
import 'package:facebook/widgets/post_container.dart';
import 'package:facebook/widgets/rooms.dart';
import 'package:facebook/widgets/stories.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utitlities.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              brightness: Brightness.light,
              backgroundColor: Colors.white,
              title: Text(
                'facebook',
                style: TextStyle(
                    color: Utilities.facebookBlue,
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
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final PostModel post = posts[index];
                  return PostContainer(post: post);
                },
                childCount: posts.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
