import 'package:facebook/models/UserModel.dart';
import 'package:facebook/utitlities.dart';
import 'package:facebook/widgets/circle_button.dart';
import 'package:facebook/widgets/custom_tabar.dart';
import 'package:facebook/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class  CustomAppBar extends StatelessWidget {
  final UserModel? currentUser;
  final List<IconData>? icons;
  final Function(int)? onTap;
  final int? selectedIndex;

  CustomAppBar({this.currentUser,this.onTap,this.icons,this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration:  BoxDecoration(
        color: Colors.white,
        boxShadow:  const[
          BoxShadow(
            color:Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),

        ]

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [ Expanded(
          child: Text(
            'facebook',
            style: TextStyle(
              color: Utilities.facebookBlue,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2),
          ),
        ),
          Container(
            height: double.infinity,
            width: 600,
            child: CustomTabBar(
              onTap: onTap,
              icons: icons,
              selectedIndex: selectedIndex,
              isButtonIndicator:true
            ),
          ),
        Expanded(child:
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            UserCard(user:currentUser),
            const SizedBox(width: 12,),
            CircleButton(
              icon: Icons.search,
              iconSize: 30,
              onPress: (){

              },
            ),
             CircleButton(
               icon: FontAwesomeIcons.facebookMessenger,
               iconSize: 30,
               onPress: (){

               },
             ),
          ],
        ))
        ],
      ),
    );
  }
}
