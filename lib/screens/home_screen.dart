import 'package:facebook/data.dart';
import 'package:facebook/models/post_model.dart';
import 'package:facebook/widgets/CreatePost.dart';
import 'package:facebook/widgets/circle_button.dart';
import 'package:facebook/widgets/contact_list.dart';
import 'package:facebook/widgets/more_option.dart';
import 'package:facebook/widgets/post_container.dart';
import 'package:facebook/widgets/responsive.dart';
import 'package:facebook/widgets/rooms.dart';
import 'package:facebook/widgets/stories.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utitlities.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController = TrackingScrollController();
  @override
  void dispose() {
   _trackingScrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _HomeScreenMobile(scrollController:_trackingScrollController),
          desktop: _HomeScreenDesktop(scrollController:_trackingScrollController),
        ),
      ),
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController? scrollController;
  _HomeScreenDesktop({this.scrollController});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child:Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: MoreOptionsList(currentUser:currentUser),
            ),
          )
        ),
        Spacer(),
        Container(
          width: 600,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
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
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
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
        Spacer(),
        Flexible(
          flex: 2,
          child:Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: ContactList(users:onlineUsers),
            ),
          ),
        ),
      ],
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController? scrollController;
  _HomeScreenMobile({this.scrollController});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
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
    );
  }
}
