// GENERATED CODE - DO NOT MODIFY BY HAND

part of media;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Media _$MediaFromJson(Map<String, dynamic> json) {
  return Media(
    json['resource'] as String,
    json['type'] as String,
    json['code'] as String,
  );
}

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'resource': instance.resource,
      'type': instance.type,
      'code': instance.code,
    };
