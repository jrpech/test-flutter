library auth_response;

import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  @JsonKey(name: "access_token")
  String accessToken;

  @JsonKey(name: "token_type")
  String tokenType;

  @JsonKey(name: "expires_in")
  double expiresIn;

  @JsonKey(name: "refresh_token")
  String refreshToken;

  @JsonKey(name: "as:client_id")
  String clientId;

  @JsonKey(name: "username")
  String userName;

  @JsonKey(name: "country_code")
  String countryCode;

  @JsonKey(name: ".issued")
  String issued;

  @JsonKey(name: ".expires")
  String expires;

  AuthResponse(
      {this.accessToken,
      this.tokenType,
      this.expiresIn,
      this.refreshToken,
      this.clientId,
      this.userName,
      this.countryCode,
      this.issued,
      this.expires});

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
