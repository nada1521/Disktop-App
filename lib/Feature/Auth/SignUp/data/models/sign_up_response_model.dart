import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response_model.g.dart';

@JsonSerializable()
class SignUpResponseModel {
  final String message;
  final UserData user;
  final String token;

  SignUpResponseModel({
    required this.message,
    required this.user,
    required this.token,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseModelToJson(this);
}

@JsonSerializable()
class UserData {
  final String name;
  final String email;
  final String role;

  UserData({
    required this.name,
    required this.email,
    required this.role,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
