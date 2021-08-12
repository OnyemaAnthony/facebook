import 'package:cached_network_image/cached_network_image.dart';

import 'package:facebook/utitlities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String? imageUr;
  final bool isActive;
  final bool hasBoarder;

  ProfileAvatar({
    this.isActive = false,
    this.imageUr,
    this.hasBoarder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Utilities.facebookBlue,
          child: CircleAvatar(
            radius: hasBoarder ? 17:20,
            backgroundColor: Colors.grey.shade200,
            backgroundImage: CachedNetworkImageProvider(imageUr!),
          ),
        ),
        isActive
            ? Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      color: Utilities.online,
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.white)),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
