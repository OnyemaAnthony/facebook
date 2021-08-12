import 'package:meta/meta.dart';

class UserModel {
  final String? name;
  final String imageUrl;

  const UserModel({
    @required this.name,
    this.imageUrl= 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  });
}