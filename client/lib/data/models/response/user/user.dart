import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class IUser with _$IUser {
  factory IUser({
    @JsonKey(name: '_id') String? id,
    String? username,
    String? email,
    String? password,
    bool? isOnline,
    List<String>? posts,
    DateTime? createdAt,
    @JsonKey(name: '__v') int? v,
  }) = _User;

  factory IUser.fromJson(Map<String, dynamic> json) => _$IUserFromJson(json);
}
