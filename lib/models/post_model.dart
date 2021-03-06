import 'package:facebook/models/UserModel.dart';
import 'package:meta/meta.dart';


class PostModel {
  final UserModel? user;
  final String? caption;
  final String? timeAgo;
  final String? imageUrl;
  final int? likes;
  final int? comments;
  final int? shares;

  const PostModel({
    @required this.user,
    @required this.caption,
    @required this.timeAgo,
    @required this.imageUrl,
    @required this.likes,
    @required this.comments,
    @required this.shares,
  });
}