import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_request_model.freezed.dart';
part 'auth_request_model.g.dart';

@freezed
class AuthRequest with _$AuthRequest {
  factory AuthRequest({
    required String email,
    required String password,
    String? username,
  }) = _AuthRequest;

  factory AuthRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthRequestFromJson(json);
}
