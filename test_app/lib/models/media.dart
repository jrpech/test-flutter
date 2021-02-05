library media;

import 'package:json_annotation/json_annotation.dart';

part 'media.g.dart';

@JsonSerializable()
class Media {
  @JsonKey(name: "resource")
  String resource;

  @JsonKey(name: "type")
  String type;

  @JsonKey(name: "code")
  String code;

  Media(this.resource, this.type, this.code);

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  Map<String, dynamic> toJson() => _$MediaToJson(this);
}
