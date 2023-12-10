import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  final String? message;
  final String? token;
  final String? role;
  AuthResponse({required this.message, this.token, this.role});

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
