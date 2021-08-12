import 'package:facebook/models/UserModel.dart';
import 'package:facebook/widgets/user_card.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final List<UserModel>? users;

  ContactList({this.users});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Contacts',
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Icon(
                Icons.search,
                color: Colors.grey.shade600,
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.more_horiz,
                color: Colors.grey.shade600,
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: users!.length,
              itemBuilder: (context, index) {
                final UserModel user = users![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: UserCard(
                    user: user,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
