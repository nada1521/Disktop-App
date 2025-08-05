import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LogInResponseModel {
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String email;
  final String token;

  LogInResponseModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.token,
  });

  factory LogInResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LogInResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LogInResponseModelToJson(this);
}
