library profile_response;

import 'package:json_annotation/json_annotation.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  @JsonKey(name: "email")
  String email;

  @JsonKey(name: "first_name")
  String firstName;

  @JsonKey(name: "last_name")
  String lastName;

  @JsonKey(name: "phone_number")
  String phoneNumber;

  @JsonKey(name: "profile_picture")
  String profilePicture;

  @JsonKey(name: "card_number")
  String cardNumber;

  ProfileResponse(
      {this.email,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.profilePicture,
      this.cardNumber});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}
