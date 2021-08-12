import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook/models/post_model.dart';
import 'package:facebook/utitlities.dart';
import 'package:facebook/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostContainer extends StatelessWidget {
  final PostModel? post;

  PostContainer({this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post!),
                const SizedBox(
                  height: 4,
                ),
                Text(post!.caption!),
                post!.imageUrl != ''
                    ? const SizedBox.shrink()
                    : const SizedBox(
                        height: 6,
                      ),
              ],
            ),
          ),
          post!.imageUrl != ''
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: CachedNetworkImage(
                    imageUrl: post!.imageUrl!,
                  ),
                )
              : SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: _PostSat(
              post: post,
            ),
          )
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final PostModel post;

  _PostHeader(this.post);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(
          imageUr: post.user!.imageUrl,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user!.name!,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo}',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey.shade600,
                    size: 12,
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
        ),
      ],
    );
  }
}

class _PostSat extends StatelessWidget {
  final PostModel? post;

  _PostSat({this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Utilities.facebookBlue, shape: BoxShape.circle),
              child: const Icon(
                Icons.thumb_up,
                size: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                '${post!.likes}',
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
            Text(
              '${post!.comments} Comments',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            Text(
              '${post!.shares} Shares',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
              icon: Icon(
                FontAwesomeIcons.thumbsUp,
                color: Colors.grey.shade600,
                size: 30,
              ),
              label:'like',
                onTap:()=>print('like')
            ),
            _PostButton(
              icon: Icon(
                FontAwesomeIcons.comment,
                color: Colors.grey.shade600,
                size: 30,
              ),
              label:'Comment',
                onTap:()=>print('comment')
            ),   _PostButton(
              icon: Icon(
                FontAwesomeIcons.share,
                color: Colors.grey.shade600,
                size: 30,
              ),
              label:'Share',
                onTap:()=>print('Share')
            )
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon? icon;
  final String? label;
  final Function? onTap;

  _PostButton({this.icon,this.label,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(child: Container(
          height:25,
          child:Row(
            children: [
              icon!,
              const SizedBox(width: 4,),
              Text(label!),
            ],
          ) ,
        )),
      ),
    );
  }
}

