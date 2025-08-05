import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  @JsonKey(name: "first_name")
  final String firstName;
  @JsonKey(name: "last_name")
  final String lastName;
  final String email;
  final String password;

  SignUpRequestBody({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
  });

  factory SignUpRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);
}
// api شكل البيانات ال هتتبعت لل 