library movies_response;

import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/models/movie.dart';

part 'movies_response.g.dart';

@JsonSerializable()
class MoviesResponse {
  List<Movie> movies;

  MoviesResponse(this.movies);

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);
}
