import 'package:flutter/material.dart';
import 'package:test_app/providers/payloads/profile_response.dart';
import 'package:test_app/widgets/profile/picture_profile.dart';

class ProfileInfo extends StatelessWidget {
  final ProfileResponse profile;

  const ProfileInfo(this.profile);

  @override
  Widget build(BuildContext context) {
    final marginBetweenItems = MediaQuery.of(context).size.height * 0.05;
    final textSize = MediaQuery.of(context).size.height * 0.03;
    return Column(children: [
      SizedBox(
        height: marginBetweenItems,
      ),
      PictureProdfile(profile.profilePicture),
      SizedBox(
        height: marginBetweenItems,
      ),
      Text("Nombre"),
      Text(profile.firstName,
          style: TextStyle(
            fontSize: textSize,
            color: Colors.blueAccent,
          )),
      Text("Apellidos"),
      Text(profile.lastName,
          style: TextStyle(
            fontSize: textSize,
            color: Colors.blueAccent,
          )),
      Text("Teléfono"),
      Text(profile.phoneNumber,
          style: TextStyle(
            fontSize: textSize,
            color: Colors.blueAccent,
          )),
      Text("Tarjeta"),
      Text(profile.cardNumber,
          style: TextStyle(
            fontSize: textSize,
            color: Colors.blueAccent,
          )),
    ]);
  }
}
