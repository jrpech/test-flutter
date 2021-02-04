// GENERATED CODE - DO NOT MODIFY BY HAND

part of auth_response;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) {
  return AuthResponse(
    accessToken: json['access_token'] as String,
    tokenType: json['token_type'] as String,
    expiresIn: (json['expires_in'] as num)?.toDouble(),
    refreshToken: json['refresh_token'] as String,
    clientId: json['as:client_id'] as String,
    userName: json['username'] as String,
    countryCode: json['country_code'] as String,
    issued: json['.issued'] as String,
    expires: json['.expires'] as String,
  );
}

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
      'refresh_token': instance.refreshToken,
      'as:client_id': instance.clientId,
      'username': instance.userName,
      'country_code': instance.countryCode,
      '.issued': instance.issued,
      '.expires': instance.expires,
    };
