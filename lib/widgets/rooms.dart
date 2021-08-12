import 'package:facebook/models/UserModel.dart';
import 'package:facebook/utitlities.dart';
import 'package:facebook/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  final List<UserModel>? onlineUsers;

  Rooms({this.onlineUsers});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal:4  ),
        scrollDirection: Axis.horizontal,
        itemCount: 1+onlineUsers!.length,
        itemBuilder: (context,index){
          if(index==0){
            return Padding(
             padding: const EdgeInsets.symmetric(horizontal: 8),
              child: _CreateRoomButton(),
            );
          }
          final UserModel user = onlineUsers![index-1];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: ProfileAvatar(isActive: true,imageUr: user.imageUrl,),
          );
        },
      ),
    );
  }

}
class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      color: Colors.white,
      borderSide: BorderSide(width: 3,color: Colors.blueAccent.shade100),
      textColor: Utilities.facebookBlue,
      onPressed: (){

      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),

      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect)=>
            Utilities.createRoomGradient.createShader(rect),
            child: Icon(
              Icons.video_call,
              size: 35,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 4,),
          Text('Create\n Room'),
          
        ],
      ),
    );
  }
}

