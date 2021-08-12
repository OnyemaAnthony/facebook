import 'package:facebook/models/UserModel.dart';
import 'package:facebook/utitlities.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoreOptionsList extends StatelessWidget {
  final List<List> _moreOptionsList = const [
    [
      Icons.person_pin_circle_outlined,
      Colors.deepPurple,
      'COVID-19 Info Center'
    ],
    [Icons.people, Colors.cyan, 'Friends'],
    [FontAwesomeIcons.facebookMessenger, Utilities.facebookBlue, 'Messenger'],
    [FontAwesomeIcons.page4, Colors.orange, 'Pages'],
    [Icons.aspect_ratio_rounded, Utilities.facebookBlue, 'Marketplace'],
    [Icons.ondemand_video_rounded, Utilities.facebookBlue, 'Watch'],
    [Icons.event, Colors.red, 'Events'],
  ];

  final UserModel? currentUser;

  MoreOptionsList({this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280),
      child: ListView.builder(
          itemCount: 1 + _moreOptionsList.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
              );
            }
            final List option = _moreOptionsList[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child:
                  _Option(icon: option[0], color: option[1], label: option[2]),
            );
          }),
    );
  }
}

class _Option extends StatelessWidget {
  final IconData? icon;
  final Color? color;
  final String? label;

  _Option({this.color, this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Icon(
            icon,
            size: 38,
            color: color,
          ),
          SizedBox(
            width: 6,
          ),
          Flexible(
            child: Text(
              label!,
              style: TextStyle(
                fontSize: 17,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
