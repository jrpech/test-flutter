library movie;

import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/models/cast.dart';
import 'package:test_app/models/media.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  @JsonKey(name: "rating")
  String rating;

  @JsonKey(name: "media")
  List<Media> media;

  @JsonKey(name: "cast")
  List<Cast> cast;
  //list<cinemas> cinema;

  @JsonKey(name: "position")
  int position;

  @JsonKey(name: "categories")
  List<String> categories;

  @JsonKey(name: "genre")
  String genre;

  @JsonKey(name: "synopsis")
  String synopsis;

  @JsonKey(name: "length")
  String length;

  @JsonKey(name: "release_date")
  DateTime releaseDate;

  @JsonKey(name: "distributor")
  String distributor;

  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "code")
  String code;

  @JsonKey(name: "original_name")
  String originalName;

  Movie(
      this.rating,
      this.media,
      this.cast,
      this.position,
      this.categories,
      this.genre,
      this.synopsis,
      this.length,
      this.releaseDate,
      this.distributor,
      this.id,
      this.name,
      this.code,
      this.originalName);

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
