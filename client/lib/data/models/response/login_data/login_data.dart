import 'package:freezed_annotation/freezed_annotation.dart';

import '../user/user.dart';

part 'login_data.freezed.dart';
part 'login_data.g.dart';

@freezed
class LoginData with _$LoginData {
  factory LoginData({
    String? accessToken,
    IUser? user,
  }) = _LoginData;

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
}
