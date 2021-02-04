import 'package:flutter/material.dart';
import 'package:test_app/providers/payloads/profile_response.dart';

class ProfileInfo extends StatelessWidget {
  final ProfileResponse profile;

  const ProfileInfo(this.profile);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(profile.firstName),
      ],
    );
  }
}
