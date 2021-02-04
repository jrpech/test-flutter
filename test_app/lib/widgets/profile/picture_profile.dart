import 'package:flutter/material.dart';

class PictureProdfile extends StatelessWidget {
  final String picture;
  PictureProdfile(this.picture);

  Image isLocalAvatar() {
    if (this.picture.isEmpty) {
      return Image.asset("");
    } else {
      return Image.network("");
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizeImage = MediaQuery.of(context).size.height * 0.2;
    return Container(
        width: sizeImage,
        height: sizeImage,
        decoration: new BoxDecoration(
            border: Border.all(color: Colors.blue, width: 3),
            shape: BoxShape.circle,
            image: new DecorationImage(
                fit: BoxFit.fill, image: NetworkImage(picture))));
  }
}
