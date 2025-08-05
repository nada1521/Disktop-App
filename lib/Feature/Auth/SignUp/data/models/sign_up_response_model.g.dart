// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponseModel _$SignUpResponseModelFromJson(Map<String, dynamic> json) =>
    SignUpResponseModel(
      message: json['message'] as String,
      user: UserData.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String,
    );

Map<String, dynamic> _$SignUpResponseModelToJson(
  SignUpResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'user': instance.user,
  'token': instance.token,
};

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
  name: json['name'] as String,
  email: json['email'] as String,
  role: json['role'] as String,
);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'role': instance.role,
};
