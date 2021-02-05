// GENERATED CODE - DO NOT MODIFY BY HAND

part of movie;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    json['rating'] as String,
    (json['media'] as List)
        ?.map(
            (e) => e == null ? null : Media.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['cast'] as List)
        ?.map(
            (e) => e == null ? null : Cast.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['position'] as int,
    (json['categories'] as List)?.map((e) => e as String)?.toList(),
    json['genre'] as String,
    json['synopsis'] as String,
    json['length'] as String,
    json['release_date'] == null
        ? null
        : DateTime.parse(json['release_date'] as String),
    json['distributor'] as String,
    json['id'] as int,
    json['name'] as String,
    json['code'] as String,
    json['original_name'] as String,
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'rating': instance.rating,
      'media': instance.media,
      'cast': instance.cast,
      'position': instance.position,
      'categories': instance.categories,
      'genre': instance.genre,
      'synopsis': instance.synopsis,
      'length': instance.length,
      'release_date': instance.releaseDate?.toIso8601String(),
      'distributor': instance.distributor,
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'original_name': instance.originalName,
    };
