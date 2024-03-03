import 'package:hive/hive.dart';

import '../../domain/entities/user.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  final String? token;

  UserModel({this.token});

  factory UserModel.fromEntity(User user) => UserModel(token: user.token ?? '');

  User toEntity() => User(token: token ?? '');
}
