
import 'package:facebook/models/UserModel.dart';
import 'package:meta/meta.dart';

class StoryModel {
  final UserModel? user;
  final String? imageUrl;
  final bool isViewed;

  const StoryModel({
    @required this.user,
    @required this.imageUrl,
    this.isViewed = false,
  });
}