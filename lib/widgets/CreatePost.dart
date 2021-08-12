import 'package:facebook/models/UserModel.dart';
import 'package:facebook/widgets/profile_avatar.dart';
import 'package:facebook/widgets/responsive.dart';
import 'package:flutter/material.dart';

class CreatePost extends StatelessWidget {
  final UserModel? currentUser;

  const CreatePost({Key? key, this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal:isDesktop?5:0 ),
      elevation: isDesktop ? 1 : 0,
      shape:  isDesktop? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
        color: Colors.white,
        child: Column(children: [
          Row(
            children: [
              ProfileAvatar(imageUr: currentUser!.imageUrl ,),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: 'What is on your mind?'),
                ),
              )
            ],
          ),
          const Divider(
            height: 10,
            thickness: 0.5,
          ),
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton.icon(
                  color: Colors.red,
                  onPressed: (){

                  },

                  icon: Icon(Icons.videocam),
                  label:Text('Live') ,
                ),
                VerticalDivider(width: 8,),
                FlatButton.icon(
                  color: Colors.green,
                  onPressed: (){

                  },

                  icon: Icon(Icons.photo_library),
                  label:Text('Photo') ,
                ),
                VerticalDivider(width: 8,),
                FlatButton.icon(
                  color: Colors.purpleAccent,
                  onPressed: (){

                  },

                  icon: Icon(Icons.video_call),
                  label:Text('Room') ,
                ),
                VerticalDivider(width: 8,),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
