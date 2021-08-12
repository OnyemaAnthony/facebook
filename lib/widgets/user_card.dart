import 'package:facebook/models/UserModel.dart';
import 'package:facebook/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final UserModel? user;

  UserCard({this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(
            imageUr: user!.imageUrl,
          ),
          const SizedBox(
            width: 6,
          ),
          Flexible(
            child: Text(
              user!.name!,
              style: const TextStyle(
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
