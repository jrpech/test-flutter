import 'package:flutter/material.dart';

class PictureProdfile extends StatelessWidget {
  final String picture;
  PictureProdfile(this.picture);

  @override
  Widget build(BuildContext context) {
    String avatarOnline =
        "https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png";
    final sizeImage = MediaQuery.of(context).size.height * 0.2;
    return Container(
        width: sizeImage,
        height: sizeImage,
        decoration: new BoxDecoration(
            border: Border.all(color: Colors.blue, width: 3),
            shape: BoxShape.circle,
            image: new DecorationImage(
                fit: BoxFit.fill,
                image:
                    NetworkImage((picture.isEmpty ? avatarOnline : picture)))));
  }
}
