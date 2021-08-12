import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook/models/UserModel.dart';
import 'package:facebook/models/story_model.dart';
import 'package:facebook/utitlities.dart';
import 'package:facebook/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final List<StoryModel>? stories;
  final UserModel? currentUser;

  Stories({this.stories, this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories!.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: _StoryCard(isAddStory: true, currentUser: currentUser),
            );
          }
          final StoryModel story = stories![index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: _StoryCard(
              story: story,
            ),
          );
        },
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final UserModel? currentUser;
  final StoryModel? story;

  const _StoryCard({
    this.story,
    this.currentUser,
    this.isAddStory = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl:
                isAddStory ? currentUser!.imageUrl : story!.user!.imageUrl,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
              gradient: Utilities.storyGradient,
              borderRadius: BorderRadius.circular(12)),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: isAddStory
              ? Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.add),
                    iconSize: 30,
                    color: Utilities.facebookBlue,
                    onPressed: () {},
                  ),
                )
              : ProfileAvatar(
                  imageUr: story!.user!.imageUrl,
                  hasBoarder: !story!.isViewed,
                ),
        ),
        Positioned(
          bottom: 8,
          right: 8,
          left: 8,
          child: Text(
            isAddStory ? 'Add to Story': story!.user!.name!,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

        )
      ],
    );
  }
}
