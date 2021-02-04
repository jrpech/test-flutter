// GENERATED CODE - DO NOT MODIFY BY HAND

part of profile_response;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) {
  return ProfileResponse(
    email: json['email'] as String,
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
    phoneNumber: json['phone_number'] as String,
    profilePicture: json['profile_picture'] as String,
    cardNumber: json['card_number'] as String,
  );
}

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone_number': instance.phoneNumber,
      'profile_picture': instance.profilePicture,
      'card_number': instance.cardNumber,
    };
