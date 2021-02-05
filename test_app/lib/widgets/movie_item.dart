import 'package:flutter/material.dart';
import 'package:test_app/models/movie.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  MovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width * 0.90;
    var columnImg = widthScreen / 2.8;
    var columnText = widthScreen / 1.6;

    return ListTile(
      contentPadding: EdgeInsets.only(top: 3.0, bottom: 3.0),
      title: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                    "https://safetyaustraliagroup.com.au/wp-content/uploads/2019/05/image-not-found.png",
                    width: columnImg,
                    height: columnImg,
                    fit: BoxFit.fitWidth),
              )
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.height * 0.01,
          ),
          Column(
            children: <Widget>[
              Row(children: <Widget>[
                Container(
                    width: columnText,
                    child: Text(
                      movie.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      textAlign: TextAlign.left,
                    ))
              ]),
            ],
          ),
        ],
      ),
      onTap: () async {
        //Navigator.pushNamed(context, Routes.productDetail, arguments: course);
      },
    );
  }
}
