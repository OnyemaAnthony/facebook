import 'package:meta/meta.dart';

class UserModel {
  final String? name;
  final String? imageUrl;

  const UserModel({
    @required this.name,
    @required this.imageUrl,
  });
}